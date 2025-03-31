//
//  StepsViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation

class StepsViewModel: ObservableObject {
    @Published var header = "He did or said something wrong. Memorize the 6 steps below to lovingly call him out:"
    @Published var steps: [DoItYourSelfStoryFormItemType] = []
    
    init() {
        
    }
    
    func prepapreData(for story: StoryType, gender: Gender) {
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
