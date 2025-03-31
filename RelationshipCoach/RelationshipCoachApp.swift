//
//  RelationshipCoachApp.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 25/03/25.
//

import SwiftUI

enum Route: Hashable {
    case story(StoryType)
    case realLifeExamples(StoryType)
    case steps
    case conversationStarters
    case coachingTips
    case doItYourSelf(StoryType)
    case addDoItYourSelfStory(StoryType)
    case updateDoItYourSelfStory(DoItYourSelfStory)
    case preference
    case coach
    case privacyPolicy
    case termsAndConditions
    case changeGender
}

class RouteManager: ObservableObject {
    @Published var routes: [Route] = []
    
    func pop() {
        routes.removeLast()
    }
}

@main
struct RelationshipCoachApp: App {
    
    init() {
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(RouteManager())
        }
    }
}
