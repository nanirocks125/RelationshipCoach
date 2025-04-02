//
//  StepsViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation

class StepsViewModel: ObservableObject {
    @Published var header = ""
    @Published var steps: [DoItYourSelfStoryFormItemType] = []
    
    init() {
        
    }
    
    func prepapreData(for story: StoryType, gender: Gender) {
        header = gender.header
        switch gender {
        case .male:
            steps = story.stepsForMale
        case .female:
            steps = story.stepsForFemale
        case .none:
            steps = []
        }
    }
}

extension Gender {
    var header: String {
        switch self {
        case .male:
            return "He did or said something wrong. Memorize the 6 steps below to lovingly call him out:"
        case .female:
            return "I say or do something wrong. Memorize the 10 steps below to lovingly allow him to call me out:"
        case .none:
            return ""
        }
    }
}
