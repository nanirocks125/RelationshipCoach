import Foundation
import StoreKit

enum RCSubscription {
    static let premium = "com.relationshipcoach.RelationshipCoachCamille.premiumsubscription"
}

@MainActor
class StoreManager: ObservableObject {

    @Published var purchasedProductIDs = Set<String>() {
        didSet {
            print("Purchased productIDs updated \(purchasedProductIDs)")
            if purchasedProductIDs.contains(RCSubscription.premium) {
                print("Premium user is true")
                premiumUser = true
            } else {
                print("Premium user is true")
                premiumUser = false
            }
        }
    }
    
    @Published var premiumUser: Bool = false

    private var productIDs = [RCSubscription.premium]

    init() {
        refreshData()
    }
    
    func refreshData() {
        Task {
            await requestProducts()
            await updatePurchasedProducts()
        }
    }

    func requestProducts() async {
        print("Refreshing products")
        do {
            _ = try await Product.products(for: productIDs)
        } catch {
            print("Failed to fetch products: \(error)")
        }
    }

    func purchase(_ product: String) async throws {
        guard
            let product = try await Product.products(for: [product]).first
        else { return }
        let result = try await product.purchase()

        switch result {
        case .success(let verification):
            // The purchase was successful
            let transaction = try checkVerified(verification)
            await updatePurchasedProducts()
            await transaction.finish()
        case .userCancelled, .pending:
            // The user canceled or the purchase is pending
            break
        @unknown default:
            break
        }
    }

    func updatePurchasedProducts() async {
        for await verificationResult in Transaction.currentEntitlements {
            guard let transaction = try? checkVerified(verificationResult) else {
                continue
            }

            if transaction.revocationDate == nil {
                self.purchasedProductIDs.insert(transaction.productID)
            } else {
                self.purchasedProductIDs.remove(transaction.productID)
            }
        }
    }

    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            throw StoreKitError.unknown
        case .verified(let safe):
            return safe
        }
    }
}
