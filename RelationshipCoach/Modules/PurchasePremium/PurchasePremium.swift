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
                VStack {
                    VStack {
                        Image(.logo)
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(16)
                    
                    
                        
                    HStack {
                        Text("Relationship Coach")
                            .foregroundStyle(.white)
                            .font(.title2)
                            .bold()
                        Text("Pro")
                            .padding(.horizontal)
                            .foregroundStyle(.theme)
                            .background(.white)
                            .cornerRadius(16)
                    }
                    .padding(.bottom, 32)
                    HStack {
                        VStack {
                            Text("End Arguments Now")
                                .font(.caption)
                                .foregroundStyle(.white)
                            Image("before_rc")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        VStack {
                            Text("Bring back the love")
                                .font(.caption)
                                .foregroundStyle(.white)
                            Image("after_rc")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .padding(.bottom, 16)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    VStack {
                        ForEach(0..<4) { index in
                            HStack {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                                Text("Feature \(index + 1)")
                                    .font(.callout)
                                    .foregroundStyle(.white)
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal, 32)
                    
                    
                    Spacer()
                    
                    
                    Button {
                        viewModel.purchase()
                    } label: {
                        VStack {
                            Text("TRY FOR FREE")
                                .bold()
                            Text("7 days trial, then $9.99 per month")
                                .font(.caption)
//                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(.white)
                        .foregroundStyle(.theme)
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    Text("You can cancel at anytime")
                        .foregroundStyle(.white)
                        .font(.caption)
//                        .bold()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.themeColor)
            }
            
        }
    }
}

#Preview {
    PurchasePremium()
}
