//
//  ShareButton.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 02/04/25.
//

import SwiftUI
let appURL = URL(string: "https://apps.apple.com/app/id6744070088")!
let appImage = UIImage(named: "logo")
struct ShareButton: View {

    var body: some View {
        ShareLink(item: appURL) {
            Label("Share My App", systemImage: "square.and.arrow.up")
        }
        .padding()
    }
}
