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

enum StoryType {
    case hisFault
    case herFault
    case myFault
    case toxic
    case giving
    case receiving
    case sweet
}

enum HomeSectionType {
    case story
    case web
    case instagram
    case preference
}

struct HomeSection {
    let type: HomeSectionType
    let items: [HomeSectionItemType]
}

class HomeViewModel: ObservableObject {
    @Published var sections: [HomeSection] = []
    
    
    init() {
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
        }
    }
}

extension HomeViewModel {
    func prepareSections(for gender: Gender) {
        sections = [
            .init(
                type: .story,
                items: gender.items + [.share]
            ),
            .init(
                type: .web,
                items: [
                    .becomeRelationshipCoach,
                    .miracleMomentsVideoSeries,
                    .relationshipMomentsAudio
                ]
            ),
            .init(
                type: .instagram,
                items: [
                    .instagram("")
                ]
            ),
            .init(
                type: .preference,
                items: [
                    .preference
                ]
            )
        ]
    }
}

extension StoryType {
    var icon: String {
        switch self {
        case .hisFault:
            return "ic_male"
        case .herFault:
            return "ic_male"
        case .myFault:
            return "ic_female"
        case .toxic:
            return "ic_flask"
        case .giving:
            return "ic_sms"
        case .receiving:
            return "ic_sms"
        case .sweet:
            return "ic_gift"
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
        case .instagram(let string):
            return "ic_instagram"
        case .preference:
            return "ic_settings"
        case .share:
            return "ic_share"
        }
    }
    
    var title: String {
        switch self {
        case .storyType(let storyType):
            return storyType.title
        case .becomeRelationshipCoach:
            return "BECOME A RELATIONSHIP COACH"
        case .miracleMomentsVideoSeries:
            return "MIRACLE MOMENTS VIDEO SERIES"
        case .relationshipMomentsAudio:
            return "RELATIONSHIP MOMENTS AUDIOS - ALL"
        case .instagram(let string):
            return "Instagram"
        case .preference:
            return "Preferences"
        case .share:
            return "Share"
        }
    }
}
