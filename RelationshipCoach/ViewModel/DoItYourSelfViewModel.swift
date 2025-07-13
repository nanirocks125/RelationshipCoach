//
//  DoItYourSelfViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation

class DoItYourSelfViewModel: ObservableObject {
    
    @Published var stories: [DoItYourSelfStory] = []
    let userDefaultsManager = UserDefaultsManager()
    
    func prepareStories(story: StoryType, for gender: Gender) async {
        let stories = await userDefaultsManager.getStories(for: gender, of: story)
        await MainActor.run {
            self.stories = stories
        }
    }
    
    func deleteStory(story: DoItYourSelfStory, for gender: Gender) async {
        await userDefaultsManager.deleteStory(for: gender, story: story)
        await prepareStories(story: story.story, for: gender)
    }
    
}
