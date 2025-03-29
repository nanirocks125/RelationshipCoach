//
//  TermsAndConditionsView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct TermsAndConditionsView: View {
    @ObservedObject var viewModel = TermsAndConditionsViewModel()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<viewModel.termsAndConditions.count, id: \.self) { index in
                    let section = viewModel.termsAndConditions[index]
                    Text(section.section)
                        .bold()
                    ForEach(0..<section.items.count, id: \.self) { itemIndex in
                        let item = section.items[itemIndex]
                        Text(item)
                    }
                }
            }
        }
    }
}

#Preview {
    TermsAndConditionsView()
}
