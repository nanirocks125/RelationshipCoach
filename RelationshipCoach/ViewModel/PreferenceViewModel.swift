//
//  PreferenceViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation
import Combine

enum PreferenceSectionType {
    case share
    case instagram
    case coach
    case legal
    case settings
    case copyright
    
    var title: String {
        switch self {
        case .coach:
            return "Relationship Coach Camille"
        case .legal:
            return "Legal Information"
        case .settings:
            return "User Settings"
        case .copyright:
            return "Copyright @2024. Relationship Coach Camille. \n All Rights Reserved."
        case .instagram:
            return "Instagram"
        case .share:
            return "Share"
        }
    }
}

enum PrefereneItemType {
    case share
    case instagram
    case coach
    case privacyPolicy
    case termsAndConditions
    case changeGender
//    case uiSettings
}

extension PrefereneItemType {
    var title: String {
        switch self {
        case .coach:
            return "About Coach Camille"
        case .privacyPolicy:
            return "Privacy Policy"
        case .termsAndConditions:
            return "Terms and Conditions"
        case .changeGender:
            return "Change Gender"
        case .instagram:
            return "Instagram"
        case .share:
            return "Share"
//        case .uiSettings:
//            return "Change Font Sizes"
        }
    }
}

struct PreferenceItem {
    var type: PrefereneItemType
}

struct PreferenceSection {
    var type: PreferenceSectionType
    var preferenceItem: [PreferenceItem]
}

class PreferenceViewModel: ObservableObject {
    
    
    @Published var sections: [PreferenceSection] = []
//    var showUISettings = false {
//        didSet {
//            prepareSection()
//        }
//    }
    
    init() {
        prepareSection()
    }
    
    func prepareSection() {
        let _sections: [PreferenceSection] = [
            .init(type: .settings, preferenceItem: [
                .init(type: .changeGender)
            ]),
            .init(type: .coach, preferenceItem: [
                .init(type: .coach)
            ]),
            .init(type: .instagram, preferenceItem: [
                .init(type: .instagram)
            ]),
            .init(type: .share, preferenceItem: [
                .init(type: .share)
            ]),
            .init(type: .copyright, preferenceItem: []),
            .init(type: .legal, preferenceItem: [
                .init(type: .privacyPolicy),
                .init(type: .termsAndConditions)
            ])
        ]
//        if showUISettings {
//            _sections.append(
//                .init(type: .uiSettings, preferenceItem: [
//                    .init(type: .uiSettings)
//                ])
//            )
//        }
        
        self.sections = _sections
    }
}

extension PrefereneItemType {
    var preferenceRoute: PreferenceRoute? {
        switch self {
        case .coach:
            return .coach
        case .privacyPolicy:
            return .privacyPolicy
        case .termsAndConditions:
            return .termsAndConditions
        case .changeGender:
            return .changeGender
//        case .uiSettings:
//            return .uiSettings
        case .share, .instagram:
            return nil
        }
    }
}
