//
//  PrivacyPolicyView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @AppStorage("gender") var gender: Gender = .female
    @ObservedObject var viewModel = PrivacyPolicyViewModel()

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<viewModel.termsAndConditions.count, id: \.self) { index in
                    let section = viewModel.termsAndConditions[index]
                    Text(section.section)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .padding(8)
                    ForEach(0..<section.items.count, id: \.self) { itemIndex in
                        let item = section.items[itemIndex]
                        Text(item)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(8)
                    }
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Privacy Policy")
                        .foregroundColor(.white)
                }
            }
            .toolbarBackground(gender.color, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    PrivacyPolicyView()
}
