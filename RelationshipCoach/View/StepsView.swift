//
//  StepsView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct StepsView: View {
    @ObservedObject var viewModel = StepsViewModel()
    @AppStorage("gender") var gender: Gender = .female
    var body: some View {
        VStack {
            Text(viewModel.header)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            VStack(alignment: .leading) {
                ForEach(0..<viewModel.steps.count, id: \.self) { index in
                    let step = viewModel.steps[index]
                    Text("\(index + 1). \(step)")
                        .foregroundStyle(gender.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 8)
                    Divider()
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 32)
            .padding(.top, 32)
            Spacer()
        }
        .padding(.top, 24)
        .navigationTitle("Steps")
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    StepsView()
}
