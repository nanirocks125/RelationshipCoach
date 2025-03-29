//
//  RelationshipCoachApp.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 25/03/25.
//

import SwiftUI

enum Route: Hashable {
    case story(StoryType)
    case realLifeExamples
    case steps
    case conversationStarters
    case coachingTips
    case doItYourSelf
    case preference
    case coach
    case privacyPolicy
    case termsAndConditions
    case changeGender
}

class RouteManager: ObservableObject {
    @Published var routes: [Route] = []
}

@main
struct RelationshipCoachApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(RouteManager())
        }
    }
}
