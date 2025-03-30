//
//  UserDefaultsManager.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation

class UserDefaultsManager {
    let userDefaults = UserDefaults.standard
    
    init() { }
    
    func getStories(for gender: Gender, of storyType: StoryType) async ->  [DoItYourSelfStory]  {
        let key = "\(gender.id)_\(storyType.id)"
        if let data = UserDefaults.standard.data(forKey: key) {
            if let existingStories = try? JSONDecoder().decode([DoItYourSelfStory].self, from: data) {
                return existingStories
            }
        }
        return []
    }
    
    func saveStory(for gender: Gender, story: DoItYourSelfStory) async {
        let key = "\(gender.id)_\(story.story.id)"
        let stories = await getStories(for: gender, of: story.story)
        let updatedStories = stories + [story]
        guard let data = try? JSONEncoder().encode(updatedStories) else { return }
        userDefaults.set(data, forKey: key)
        userDefaults.synchronize()
    }
    
    func updateStory(for gender: Gender, story: DoItYourSelfStory) async {
        let key = "\(gender.id)_\(story.story.id)"
        var stories = await getStories(for: gender, of: story.story)
        if let index = stories.firstIndex(where: { $0.id == story.id }) {
            stories[index] = story
        }
        guard let data = try? JSONEncoder().encode(stories) else { return }
        userDefaults.set(data, forKey: key)
        userDefaults.synchronize()
    }
    
    func deleteStory(for gender: Gender, story: DoItYourSelfStory) async {
        let key = "\(gender.id)_\(story.story.id)"
        var stories = await getStories(for: gender, of: story.story)
        stories.removeAll(where: { $0.id == story.id })
        guard let data = try? JSONEncoder().encode(stories) else { return }
        userDefaults.set(data, forKey: key)
        userDefaults.synchronize()
    }
}
