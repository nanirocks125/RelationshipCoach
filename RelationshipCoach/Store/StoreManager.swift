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
    // The listener for transaction updates.
    private var transactionListener: Task<Void, Error>? = nil
    
    private var productIDs = [RCSubscription.premium]

    init() {
        transactionListener = listenForTransactions()

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
            
            // Initiate the purchase flow.
            let result = try await product.purchase()

            switch result {
            case .success(let verification):
                // The purchase was successful.
                let transaction = try checkVerified(verification)
                
                // Update the user's status with the new transaction.
                handle(transaction: transaction)
                
                // Always finish the transaction after successfully delivering the content.
                await transaction.finish()

            case .userCancelled:
                // The user canceled the purchase. No action needed.
                break
            case .pending:
                // The purchase is pending and requires action from the user.
                // The transaction listener will handle the final result.
                break
            @unknown default:
                break
            }
        }
    
    /// Creates a long-running task to listen for and handle all transaction updates.
    private func listenForTransactions() -> Task<Void, Error> {
        return Task.detached {
            // Iterate through any transactions that came in while the app was closed or in the background.
            for await result in Transaction.updates {
                do {
                    let transaction = try await self.checkVerified(result)
                    
                    // The transaction is valid. Deliver the purchased content.
                    await self.handle(transaction: transaction)
                    
                    // Always finish the transaction.
                    await transaction.finish()
                } catch {
                    // This catch block will handle verification failures.
                    print("Transaction failed verification: \(error)")
                }
            }
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
