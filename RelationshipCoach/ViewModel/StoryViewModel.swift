//
//  StoryViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation

enum StorySectionType {
    case realLifeExamples
    case steps
    case conversationStarters
    case coachingTips
    case doItYourSelf
}

extension StorySectionType {
    var title: String {
        switch self {
        case .realLifeExamples:
            return "Real Life Examples"
        case .steps:
            return "Steps"
        case .conversationStarters:
            return "Conversation Starters"
        case .coachingTips:
            return "Coaching Tips"
        case .doItYourSelf:
            return "Do It Yourself"
        }
    }
    var description: String {
        switch self {
        case .realLifeExamples:
            return "Real life examples you can use."
        case .steps:
            return "The six steps you can follow."
        case .conversationStarters:
            return "More examples of each step."
        case .coachingTips:
            return "Helpful tips from the expert."
        case .doItYourSelf:
            return "Practice the steps yourself!"
        }
    }
}

struct StorySecton {
    var type: StorySectionType
}

class StoryViewModel: ObservableObject {
    @Published var sections: [StorySectionType] = [
        .realLifeExamples,
        .steps,
        .conversationStarters,
        .coachingTips,
        .doItYourSelf
    ]
}
