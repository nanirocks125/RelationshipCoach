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

    /// Initiates a purchase for the premium subscription.
        func purchase() async throws {
            // Ensure we have the product details from the App Store.
            guard let product = try await Product.products(for: [RCSubscription.premium]).first else {
                // This could happen if the product ID is incorrect or not set up in App Store Connect.
                throw StoreKitError.unknown
            }
            print("Initing purchase flow")
            // Initiate the purchase flow.
            let result = try await product.purchase()
            
            switch result {
            case let .success(.verified(transaction)):
                print("Successful purchase")
                // Successful purhcase
                await transaction.finish()
                refreshData()
            case let .success(.unverified(_, error)):
                print("Successful unverfied purchase")

                // Successful purchase but transaction/receipt can't be verified
                // Could be a jailbroken phone
                print("Unverified purchase. Might be jailbroken. Error: \(error)")
                break
            case .pending:
                print("Pending")
                // Transaction waiting on SCA (Strong Customer Authentication) or
                // approval from Ask to Buy
                break
            case .userCancelled:
                // ^^^
                print("User Cancelled!")
                break
            @unknown default:
                print("Failed to purchase the product!")
                break
            }
        }
    
    /// Updates the local state based on a single transaction.
    private func handle(transaction: Transaction) {
        if transaction.revocationDate == nil {
            // If there's no revocation date, the purchase is valid.
            print("Adding purchased product: \(transaction.productID)")
            purchasedProductIDs.insert(transaction.productID)
        } else {
            // The purchase was revoked by customer support or due to a refund.
            print("Removing revoked product: \(transaction.productID)")
            purchasedProductIDs.remove(transaction.productID)
        }
        self.updatePremiumStatus()
    }
    
    /// Centralized method to update the `premiumUser` state.
        private func updatePremiumStatus() {
            let isPremium = purchasedProductIDs.contains(RCSubscription.premium)
            print("Premium user status is now: \(isPremium)")
            self.premiumUser = isPremium
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
