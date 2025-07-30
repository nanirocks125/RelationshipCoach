//
//  SubscriptionManager.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 30/07/25.
//

import StoreKit
import Combine

enum RCSubscription {
    static let premium = "com.relationshipcoach.RelationshipCoachCamille.premiumsubscription"
}

@MainActor
class SubscriptionsManager: NSObject {
    
    static let shared = SubscriptionsManager()
    public var transactionFinished: AnyPublisher<Void, Never> {
        transactionFinishedSubject.eraseToAnyPublisher()
    }
    private let transactionFinishedSubject = PassthroughSubject<Void, Never>()

    let productIDs: [String] = [RCSubscription.premium]
    var purchasedProductIDs: Set<String> = [] {
        didSet {
            print("Purchased productIDs updated \(purchasedProductIDs)")
            if purchasedProductIDs.contains(RCSubscription.premium) {
                print("Premium user is true")
                premiumUser.value = true
            } else {
                print("Premium user is false")
                premiumUser.value = false
            }
        }
    }
    @Published var products: [Product] = []
    let premiumUser = CurrentValueSubject<Bool, Never>(false)

    private var updates: Task<Void, Never>? = nil
    
    private override init() {
        super.init()
        self.updates = observeTransactionUpdates()
        SKPaymentQueue.default().add(self)
        Task {
            await updatePurchasedProducts()
            await loadProducts()
        }
    }
    
    deinit {
        updates?.cancel()
    }
    
    func observeTransactionUpdates() -> Task<Void, Never> {
        Task(priority: .background) { [unowned self] in
            for await _ in Transaction.updates {
                print("Update purcahsed products")
                await self.updatePurchasedProducts()
            }
        }
    }
}

// MARK: StoreKit2 API
extension SubscriptionsManager {
    func loadProducts() async {
        do {
            self.products = try await Product.products(for: productIDs)
                .sorted(by: { $0.price > $1.price })
        } catch {
            print("Failed to fetch products!")
        }
    }
    
    func buyProduct(_ product: Product) async {
        do {
            let result = try await product.purchase()
            
            switch result {
            case let .success(.verified(transaction)):
                // Successful purhcase
                await transaction.finish()
                await self.updatePurchasedProducts()
                self.transactionFinishedSubject.send(())
            case let .success(.unverified(_, error)):
                // Successful purchase but transaction/receipt can't be verified
                // Could be a jailbroken phone
                print("Unverified purchase. Might be jailbroken. Error: \(error)")
                break
            case .pending:
                // Transaction waiting on SCA (Strong Customer Authentication) or
                // approval from Ask to Buy
                break
            case .userCancelled:
                print("User cancelled!")
                break
            @unknown default:
                print("Failed to purchase the product!")
                break
            }
        } catch {
            print("Failed to purchase the product!")
        }
    }
    
    func updatePurchasedProducts() async {
        print("Updating purchased products")
        for await result in Transaction.currentEntitlements {
            guard case .verified(let transaction) = result else {
                continue
            }
            if transaction.revocationDate == nil {
                self.purchasedProductIDs.insert(transaction.productID)
            } else {
                self.purchasedProductIDs.remove(transaction.productID)
            }
        }
    }
    
    func restorePurchases() async {
        do {
            print("Restoring")
            try await AppStore.sync()
            print("Restoring done")
        } catch {
            print(error)
        }
    }
}

extension SubscriptionsManager: SKPaymentTransactionObserver {
    nonisolated func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("Updated transactions")
    }
    
    nonisolated func paymentQueue(_ queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
        print("Removed transactions")
    }
    
    nonisolated func paymentQueue(_ queue: SKPaymentQueue, shouldAddStorePayment payment: SKPayment, for product: SKProduct) -> Bool {
        return true
    }
}
