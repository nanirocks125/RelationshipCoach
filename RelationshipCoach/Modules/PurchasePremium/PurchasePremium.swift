//
//  PurchasePremium.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 13/07/25.
//

import SwiftUI
import Lottie
import StoreKit
import Combine

@MainActor
class PurchasePremiumViewModel: ObservableObject {
    let storeManager = SubscriptionsManager.shared
    @Published var isPurchasing: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    let transactionFinished: AnyPublisher<Void, Never>
    
    init() {
        transactionFinished = storeManager.transactionFinished
    }
    
    func restore() async {
        print("Restore in vm")
        isPurchasing = true
        await storeManager.restorePurchases()
        isPurchasing = false
    }
    
    func purchase() {
        Task {
            do {
                guard let product = try await Product.products(for: [RCSubscription.premium]).first else {
                    // This could happen if the product ID is incorrect or not set up in App Store Connect.
                    return
                }
                isPurchasing = true
                
                await storeManager.buyProduct(product)
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
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(.white)
                        .onTapGesture {
                            dismiss()
                        }
                    Spacer()
                    Button("Restore") {
                        viewModel.purchase()
                    }
                    .foregroundStyle(.white)
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
                        Text("3 days trial, then $9.99 per month")
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
                Link("Terms & Conditions", destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/")!)
                    .foregroundStyle(.white)

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
        .onAppear {
            viewModel.transactionFinished.sink { _ in
                self.dismiss()
            }.store(in: &viewModel.cancellables)
        }
    }
}

#Preview {
    PurchasePremium()
}
