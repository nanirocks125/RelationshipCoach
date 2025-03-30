//
//  AddStoryViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation

enum DoItYourSelfStoryFormItemType: Codable {
    case heartFeelingOrFact
    case negativeSelfFeelingStatement
    case callToAction
    case clarification
    case appreciation
}

struct DoItYourSelfStoryFormItem: Codable, Hashable {
    let type: DoItYourSelfStoryFormItemType
    let fromGenderTitle: String
    let userSaidTitle: String
    var fromGenderSaid: String
    var userSaid: String
}

struct DoItYourSelfStory: Codable {
    var id: String
    let story: StoryType
    let createdAt: Date
    var updatedAt: Date
    var items: [DoItYourSelfStoryFormItem]
}

extension DoItYourSelfStory: Equatable, Hashable {
    
}

class AddDoItYourSelfStoryViewModel: ObservableObject {
    @Published var items: [DoItYourSelfStoryFormItem] = []
    let userDefaultsManager = UserDefaultsManager()
    var story: StoryType?
    init() {
        
    }
    
    func prepareForm(story: StoryType, doItYourSelfStory: DoItYourSelfStory?) {
        self.story = story
        if let doItYourSelfStory = doItYourSelfStory {
            self.items = doItYourSelfStory.items
        } else {
            self.items = story.items
        }
        
    }
    
    func saveData(gender: Gender) async {
        guard let story else { return }
        let storyToSave = DoItYourSelfStory(
            id: UUID().uuidString,
            story: story,
            createdAt: Date(),
            updatedAt: Date(),
            items: items)
        await userDefaultsManager.saveStory(for: gender, story: storyToSave)
    }
    
    func updateData(for story: DoItYourSelfStory, gender: Gender) async {
        var storyToUpdate = story
        storyToUpdate.items = self.items
        storyToUpdate.updatedAt = Date()
        await userDefaultsManager.updateStory(for: gender, story: storyToUpdate)
    }
}


extension StoryType {
    var items: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                type: .heartFeelingOrFact,
                fromGenderTitle: "He did or said something wrong:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .negativeSelfFeelingStatement,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .callToAction,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .clarification,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .appreciation,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            )
        ]
    }
}
