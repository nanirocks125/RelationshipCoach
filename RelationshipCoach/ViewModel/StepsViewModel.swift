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
    
    func prepareData(for story: StoryType, gender: Gender) {
        switch gender {
        case .male:
            steps = story.stepsForMale
            header = story.stepsViewHeaderForMale
        case .female:
            steps = story.stepsForFemale
            header = story.stepsViewHeaderForFemale
        case .none:
            steps = []
        }
    }
}
