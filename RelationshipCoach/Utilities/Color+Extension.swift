//
//  Color+Extension.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation
import SwiftUI

extension Color {
    static let backgroundColor = Color("background")
    static let textColor = Color("textColor")
    static let femaleColor = Color(hex: 0xc35a88)
    static let maleColor = Color(hex: 0x1a60e3)
    static let rowBackgroundColor = Color("rowBackgroundColor")
    static let rowDescriptionColor = Color("rowDescriptionColor")
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
