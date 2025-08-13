//
//  RCCardView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 13/08/25.
//

import SwiftUI

struct RCCardView<Content: View>: View {
    let height: CGFloat
    let content: () -> Content

    init(height: CGFloat,
         @ViewBuilder content: @escaping () -> Content) {
        self.height = height
        self.content = content
    }

    var body: some View {
        HStack {
            content()
        }
        .frame(height: height)
        .padding(.horizontal, 8)
        .background(Color.backgroundColor)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 3)
        .padding(4)
        .padding(.horizontal, 8)
    }
}
