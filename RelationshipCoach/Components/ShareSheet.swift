//
//  ShareSheet.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 02/04/25.
//

import Foundation
import UIKit
import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // This view controller manages its own state and does not need to be updated
        // from the SwiftUI environment after it has been created.
    }
}
