//
//  PreferenceViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation
import Combine

enum PreferenceSectionType {
    case coach
    case legal
    case settings
    case copyright
    case uiSettings
    
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
        case .uiSettings:
            return "UI Settings"
        }
    }
}

enum PrefereneItemType {
    case coach
    case privacyPolicy
    case termsAndConditions
    case changeGender
    case uiSettings
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
            return "CHANGE GENDER"
        case .uiSettings:
            return "Change Font Sizes"
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
    var showUISettings = false {
        didSet {
            prepareSection()
        }
    }
    
    init() {
        prepareSection()
    }
    
    func prepareSection() {
        var _sections: [PreferenceSection] = [
            .init(type: .coach, preferenceItem: [
                .init(type: .coach)
            ]),
            .init(type: .legal, preferenceItem: [
                .init(type: .privacyPolicy),
                .init(type: .termsAndConditions)
            ]),
            .init(type: .settings, preferenceItem: [
                .init(type: .changeGender)
            ]),
            .init(type: .copyright, preferenceItem: [])
        ]
        if showUISettings {
            _sections.append(
                .init(type: .uiSettings, preferenceItem: [
                    .init(type: .uiSettings)
                ])
            )
        }
        
        self.sections = _sections
    }
}

extension PrefereneItemType {
    var preferenceRoute: Route {
        switch self {
        case .coach:
            return .coach
        case .privacyPolicy:
            return .privacyPolicy
        case .termsAndConditions:
            return .termsAndConditions
        case .changeGender:
            return .changeGender
        case .uiSettings:
            return .uiSettings
        }
    }
}
