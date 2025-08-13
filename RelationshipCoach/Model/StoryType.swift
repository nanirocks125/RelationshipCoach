//
//  StoryType.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 31/03/25.
//

import Foundation

enum StoryType: Codable {
    case hisFault
    case herFault
    case myFault
    case toxic
    case giving
    case receiving
    case sweet
}

extension StoryType {
    var navigationTitle: String {
        switch self {
        case .hisFault:
            "His Fault"
        case .herFault:
            "Her Fault"
        case .myFault:
            "My Fault"
        case .toxic:
            "Toxic Chat"
        case .giving:
            "Giving Talk"
        case .receiving:
            "Receiving Talk"
        case .sweet:
            "Sweet Talk"
        }
    }
}
