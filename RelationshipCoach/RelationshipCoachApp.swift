//
//  RelationshipCoachApp.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 25/03/25.
//

import SwiftUI

enum PreferenceRoute: Hashable {
    case preference
    case coach
    case privacyPolicy
    case termsAndConditions
    case changeGender
}

enum Route: Hashable {
    case story(StoryType)
    case realLifeExamples(StoryType)
    case steps(StoryType)
    case conversationStarters(StoryType)
    case coachingTips(StoryType)
    case doItYourSelf(StoryType)
    case addDoItYourSelfStory(StoryType)
    case updateDoItYourSelfStory(DoItYourSelfStory)
}

class RouteManager: ObservableObject {
    @Published var routes: [Route] = []
    
    func pop() {
        routes.removeLast()
    }
}

@main
struct RelationshipCoachApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RouteManager())
        }
    }
}
