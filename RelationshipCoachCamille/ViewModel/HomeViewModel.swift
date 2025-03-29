//
//  HomeViewModel.swift
//  RelationshipCoachCamille
//
//  Created by Manikanta Nandam on 25/03/25.
//

import Foundation
import Combine

struct HomeSectionItem {
    let icon: String
    let title: String
}

enum HomeSectionType {
    case story
    case web
    case instagram
    case preference
}

struct HomeSection {
    let type: HomeSectionType
    let items: [HomeSectionItem]
}

class HomeViewModel: ObservableObject {
    @Published var sections: [HomeSection] = []
    @Published var routes: [HomeViewRoute] = []
    
    var cancellables = Set<AnyCancellable>()
    let itemTapped = PassthroughSubject<(Int, Int), Never>()
    
    init() {
        prepareSections()
        handleEvents()
    }
    
    func handleEvents() {
        itemTapped.sink { [weak self] sectionIndex, itemIndex in
            guard let self = self else { return }
            
            let section = sections[sectionIndex]
            if section.type == .story {
                routes.append(.story)
            }
        }.store(in: &cancellables)
    }
    
}

extension HomeViewModel {
    func prepareSections() {
        sections = [
            .init(
                type: .story,
                items: [
                    .init(icon: "ic_male",
                          title: "His Fault Love Chat"),
                    .init(icon: "ic_female",
                          title: "My Fault Love Chat"),
                    .init(icon: "ic_gift",
                          title: "Toxic Chat"),
                    .init(icon: "ic_sms",
                          title: "Receiving Talk"),
                    .init(icon: "ic_gift",
                          title: "Sweet Talk"),
                    .init(icon: "ic_share",
                          title: "Share"),
                ]
            ),
            .init(
                type: .web,
                items: [
                    .init(icon: "ic_cart", title: "BECOME A RELATIONSHIP COACH"),
                    .init(icon: "ic_cart", title: "MIRACLE MOMENTS VIDEO SERIES"),
                    .init(icon: "ic_cart", title: "RELATIONSHIP MOMENTS AUDIOS - ALL")
                ]
            ),
            .init(
                type: .instagram,
                items: [
                    .init(icon: "ic_instagram", title: "Instagram")
                ]
            ),
            .init(
                type: .preference,
                items: [
                    .init(icon: "ic_settings", title: "Preferences")
                ]
            )
        ]
    }
}
