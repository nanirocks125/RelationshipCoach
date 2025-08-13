//
//  RCIconView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 13/08/25.
//

import SwiftUI

struct RCIconView: View {
    let name: String
    let size: CGFloat
    let iconSize: CGFloat
    
    init(name: String,
         size: CGFloat = 48,
         iconSize: CGFloat = 28) {
        self.name = name
        self.size = size
        self.iconSize = iconSize
    }
    
    var body: some View {
        Image(RCAsset.icBackgroundCircle)
            .resizable()
            .frame(width: size, height: size)
            .overlay {
                Image(name)
                    .resizable()
                    .frame(width: iconSize, height: iconSize)
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: .black.opacity(0.62), radius: 13)
            }
    }
}
