//
//  PurchasePremium.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 13/07/25.
//

import SwiftUI

@MainActor
class PurchasePremiumViewModel: ObservableObject {
    let storeManager = StoreManager()
    @Published var isPurchasing: Bool = false
    
    func purchase() {
        Task {
            do {
                isPurchasing = true
                try await storeManager.purchase(RCSubscription.premium)
                isPurchasing = false
            } catch {
                print("Purchasing failed: \(error.localizedDescription)")
                isPurchasing = false
            }
            
        }
        
    }
}

struct PurchasePremium: View {
    
    @StateObject var viewModel: PurchasePremiumViewModel = .init()
    
    var body: some View {
        VStack {
            if viewModel.isPurchasing {
                Text("Purchasing")
            } else {
                Button("Purchase") {
                    viewModel.purchase()
                }
            }
            
        }
    }
}

#Preview {
    PurchasePremium()
}
