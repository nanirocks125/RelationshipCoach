//
//  PurchasePremium.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 13/07/25.
//

import SwiftUI
import Lottie

@MainActor
class PurchasePremiumViewModel: ObservableObject {
    let storeManager = StoreManager()
    @Published var isPurchasing: Bool = false
    
    func purchase() {
        Task {
            do {
                isPurchasing = true
                try await storeManager.purchase()
                isPurchasing = false
            } catch {
                print("Purchasing failed: \(error.localizedDescription)")
                isPurchasing = false
            }
            
        }
        
    }
}

struct PurchasePremium: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: PurchasePremiumViewModel = .init()
    
    let proFeatures = [
        "His Fault/ Her Fault Love Chat",
        "My Fault Love Chat",
        "Toxic Chat",
        "Receiving Talk/ Giving Talk",
        "Sweet Talk",
        "Coaching Tips",
        "Guided DIY"
    ]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    if !viewModel.isPurchasing {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(.white)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                    Spacer()
                }
                .padding()
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
                    ForEach(proFeatures, id: \.self) { feature in
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.white)
                            Text(feature)
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
            .overlay {
                if viewModel.isPurchasing {
                    Rectangle()
                        .fill(Color.black.opacity(0.4))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            if viewModel.isPurchasing {
                VStack {
                    LottieView(animation: .named("Hearts feedback"))
                        .playing()
                        .looping()
                        .frame(width: 100, height: 100)


                    Text("Purchasing")
                        .font(.body)
                        .foregroundStyle(.white)
                }
                
            }
        }
    }
}

#Preview {
    PurchasePremium()
}
