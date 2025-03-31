//
//  String+Utilities.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 01/04/25.
//

import Foundation
import SwiftUI

extension String {
    var attributedString: AttributedString {
        var text = AttributedString(self)
        text.foregroundColor = Color.textColor
        text.font = .systemFont(ofSize: 17)
        return text
    }
    
    var maleAttributedString: AttributedString {
        var text = AttributedString(self)
        text.foregroundColor = Gender.male.color
        text.font = .systemFont(ofSize: 17, weight: .bold)
        return text
    }
    
    var femaleAttributedString: AttributedString {
        var text = AttributedString(self)
        text.foregroundColor = Gender.female.color
        text.font = .systemFont(ofSize: 17, weight: .bold)
        return text
    }
}
