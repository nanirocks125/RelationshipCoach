import Foundation
import StoreKit

@MainActor
class StoreManager: ObservableObject {

    @Published var monthlySubscription: Product?
    @Published var purchasedProductIDs = Set<String>() {
        didSet {
            if purchasedProductIDs.contains("com.relationshipcoach.RelationshipCoachCamille.premiumsubscription") {
                premiumUser = true
            } else {
                premiumUser = false
            }
        }
    }
    
    @Published var premiumUser: Bool = false

    private var productIDs =
    ["com.relationshipcoach.RelationshipCoachCamille.premiumsubscription"]

    init() {
        Task {
            await requestProducts()
            await updatePurchasedProducts()
        }
    }

    func requestProducts() async {
        do {
            let products = try await Product.products(for: productIDs)
            monthlySubscription = products.first
        } catch {
            print("Failed to fetch products: \(error)")
        }
    }

    func purchase(_ product: Product) async throws {
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
