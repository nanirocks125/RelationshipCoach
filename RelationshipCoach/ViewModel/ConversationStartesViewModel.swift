//
//  ConversationStartesViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation

struct ConversationStarter {
    let title: String
    let statements: [StoryStatement]
}

class ConversationStartesViewModel: ObservableObject {
    @Published var conversationStarters: [ConversationStarter] = []
    
    func prepareData(for gender: Gender, story: StoryType) {
        switch gender {
        case .male:
            conversationStarters = story.coachingStartersForMale
        case .female:
            conversationStarters = story.coachingStartersForFemale
        case .none:
            conversationStarters = []
        }
    }
}
