//
//  RCIconView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 13/08/25.
//

import SwiftUI

struct RCIconView: View {
    let name: String
    let backgroundColor: Color
    let dropShadowColor: Color
    let radius: CGFloat
    let iconSize: CGFloat
    
    init(name: String,
         backgroundColor: Color,
         dropShadowColor: Color = Color.black,
         radius: CGFloat = 48,
         iconSize: CGFloat = 28) {
        self.name = name
        self.backgroundColor = backgroundColor
        self.dropShadowColor = dropShadowColor
        self.radius = radius
        self.iconSize = iconSize
    }
    
    var body: some View {
        Circle()
            .fill(backgroundColor)
            .stroke(Color.white, lineWidth: 2)
            .frame(width: radius, height: radius)
            .overlay {
                Image(name)
                    .resizable()
                    .frame(width: iconSize, height: iconSize)
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: dropShadowColor.opacity(0.62), radius: 13)
            }
    }
}
