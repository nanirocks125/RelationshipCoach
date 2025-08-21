//
//  HomeViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 25/03/25.
//

import Foundation
import Combine

enum HomeSectionItemType {
    case storyType(StoryType)
    case becomeRelationshipCoach
    case miracleMomentsVideoSeries
    case relationshipMomentsAudio
    case instagram(String)
    case preference
    case share
}

extension HomeSectionItemType {
    var story: StoryType? {
        if case .storyType(let storyType) = self {
            return storyType
        } else {
            return nil
        }
    }
    
    var isSharing: Bool {
        if case .share = self {
            return true
        } else {
            return false
        }
    }
    
    var isInstagram: Bool {
        if case .instagram(_) = self {
            return true
        } else {
            return false
        }
    }
    
    var url: URL? {
        switch self {
        case .becomeRelationshipCoach:
            return URL(string: "https://relationshipcoachllc.com/products/become-a-coach")
        case .relationshipMomentsAudio:
            return URL(string: "https://relationshipcoachllc.com/products/relationship-success-action-tips-podcasts-via-our-app")
        case .miracleMomentsVideoSeries:
            return URL(string: "https://relationshipcoachllc.com/products/miracle-moments-video-series")
        default:
            return nil
        }
    }
}

enum HomeSectionType {
    case story
    case web
    case instagram
    case preference
    case share
}

public struct HomeSection {
    let type: HomeSectionType
    let items: [HomeSectionItemType]
}

public class HomeViewModel: ObservableObject {
    @Published public private(set) var sections: [HomeSection] = []
    
    public init() {
        // Public init to make sure it is accessible for unit tests.
    }
}

extension Gender {
    var items: [HomeSectionItemType] {
        switch self {
        case .male:
            return [
                .storyType(.herFault),
                .storyType(.myFault),
                .storyType(.toxic),
                .storyType(.giving),
                .storyType(.sweet),
            ]
        case .female:
            return [
                .storyType(.hisFault),
                .storyType(.myFault),
                .storyType(.toxic),
                .storyType(.receiving),
                .storyType(.sweet)
            ]
        case .none:
            return []
        }
    }
}

public extension HomeViewModel {
    func prepareSections(for gender: Gender) {
        sections = [
            .init(
                type: .story,
                items: gender.items
//                + [.share]
            ),
//            .init(
//                type: .web,
//                items: [
//                    .becomeRelationshipCoach,
//                    .miracleMomentsVideoSeries,
//                    .relationshipMomentsAudio
//                ]
//            ),
            .init(
                type: .instagram,
                items: [
                    .instagram(""),
                ]
            ),
            .init(
                type: .share,
                items: [
                    .share
                ]
            )
//            .init(
//                type: .preference,
//                items: [
//                    .preference
//                ]
//            )
        ]
    }
}

extension StoryType {
    var id: String {
        switch self {
        case .hisFault:
            return "hisFault"
        case .herFault:
            return "herFault"
        case .myFault:
            return "myFault"
        case .toxic:
            return "toxic"
        case .giving:
            return "giving"
        case .receiving:
            return "receiving"
        case .sweet:
            return "sweet"
        }
    }
    var icon: String {
        switch self {
        case .hisFault:
            return RCAsset.ic_male
        case .herFault:
            return RCAsset.ic_male
        case .myFault:
            return RCAsset.ic_female
        case .toxic:
            return RCAsset.ic_flask
        case .giving:
            return RCAsset.ic_sms
        case .receiving:
            return RCAsset.ic_sms
        case .sweet:
            return RCAsset.ic_gift
        }
    }
    
    var title: String {
        switch self {
        case .hisFault:
            "His Fault Love Chat"
        case .herFault:
            "Her Fault Love Chat"
        case .myFault:
            "My Fault Love Chat"
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

extension HomeSectionItemType {
    var icon: String {
        switch self {
        case .storyType(let storyType):
            return storyType.icon
        case .becomeRelationshipCoach,
             .miracleMomentsVideoSeries,
             .relationshipMomentsAudio:
            return "ic_cart"
        case .instagram:
            return "ic_instagram"
        case .preference:
            return "ic_settings"
        case .share:
            return RCAsset.share
        }
    }
    
    var title: String {
        switch self {
        case .storyType(let storyType):
            return storyType.title
        case .becomeRelationshipCoach:
            return "BECOME A RELATIONSHIP COACH"
        case .miracleMomentsVideoSeries:
            return "SINGLE WOMEN - MIRACLE MOMENTS"
        case .relationshipMomentsAudio:
            return "ALL PEOPLE - RELATIONSHIP MOMENTS"
        case .instagram:
            return "Instagram"
        case .preference:
            return "Preferences"
        case .share:
            return "Share"
        }
    }
}
