//
//  SubsciptionView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 08/07/25.
//

import Foundation
import SwiftUI
import StoreKit

struct SubscriptionView: View {
    @EnvironmentObject var storeManager: StoreManager

    var body: some View {
        VStack {
            if let subscription = storeManager.monthlySubscription {
                Text("Upgrade to Premium")
                    .font(.largeTitle)
                    .padding()

                Text("Get access to all our premium features.")
                    .font(.headline)
                    .padding()

                Button(action: {
                    Task {
                        try? await storeManager.purchase(subscription)
                    }
                }) {
                    Text("\(subscription.displayName) - \(subscription.displayPrice)/month")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            } else {
                Text("Loading...")
                ProgressView()
            }
        }
        .onAppear {
            Task {
                await storeManager.requestProducts()
            }
        }
    }
}
