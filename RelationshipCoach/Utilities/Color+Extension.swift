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
    static let secondaryBackgroundColor = Color("secondaryBackgroundColor")
    static let textColor = Color("textColor")
    static let femaleColor = Color(hex: 0xc35a88)
//    static let maleColor = Color(hex: 0x742691)
    static let maleColor = Color(hex: 0x1a60e3)
    static let rowBackgroundColor = Color("rowBackgroundColor")
    static let rowDescriptionColor = Color("rowDescriptionColor")
    static let themeColor = Color("theme")
}

extension UIColor {
    static let femaleColor = UIColor(hex: 0xc35a88)
    static let maleColor = UIColor(hex: 0x1a60e3)
//    static let maleColor = UIColor(hex: 0x742691)
    
}
//116 38 145
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

extension UIColor {
    convenience init(hex: Int, opacity: Double = 1) {
        self.init(
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            alpha: opacity
        )
    }
}
