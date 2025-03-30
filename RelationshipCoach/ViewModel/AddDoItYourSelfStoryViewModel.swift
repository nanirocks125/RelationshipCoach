//
//  AddStoryViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation

enum DoItYourSelfStoryFormItemType: Codable {
    
    // Hist Fault & My Fault
    case clarification
    
    // His Fault
    case heartFeelingOrFact
    case negativeSelfFeelingStatement
    case callToAction
    case appreciation
    
    // My Fault
    case admit
    case apologize
    case firstAppreciation
    case commitToChange
    case askForgiveness
    case soothingCycle
    case feelFeltFindingOut
    case secondAppreciation
    case reconnect
    
    // Toxic Chat
    case heartFeeling
    case bodyFeeling
    case givePermission
    case takeYourFeelingsForAWalk
    
    // Receiving Talk
    case thankYouMessages
    case appreciationMessages
    case admirationMessages
    case respectMessages
    
    // Sweet Talk
    case senseOfTouch
    case senseOfTaste
    case senseOfSmell
    case senseOfHearing
    case senseOfSight
}


extension DoItYourSelfStoryFormItemType {
    var displayString: String {
        switch self {
        case .heartFeelingOrFact:
            return "(heart feeling/fact)"
        case .negativeSelfFeelingStatement:
            return "(negative self-feeling statement)"
        case .callToAction:
            return "(call to action)"
        case .clarification:
            return "(clarification)"
        case .appreciation:
            return "(appreciation)"
        case .admit:
            return "(admit)"
        case .apologize:
            return "(apologize)"
        case .firstAppreciation:
            return "(first appreciation)"
        case .commitToChange:
            return "(commit-to-change)"
        case .askForgiveness:
            return "(ask forgiveness)"
        case .soothingCycle:
            return "(soothing cycle)"
        case .feelFeltFindingOut:
            return "(feel-felt finding out)"
        case .secondAppreciation:
            return "(second appreciation)"
        case .reconnect:
            return "(reconnect)"
        case .heartFeeling:
            return "(heart feelings)"
        case .bodyFeeling:
            return "(body feelings)"
        case .givePermission:
            return "(give permission)"
        case .takeYourFeelingsForAWalk:
            return "(take your feelings for a walk)"
        case .thankYouMessages:
            return "(thank you messages)"
        case .appreciationMessages:
            return "(appreciation messages)"
        case .admirationMessages:
            return "(admiration messages)"
        case .respectMessages:
            return "(respect messages)"
        case .senseOfTouch:
            return "(sense of touch)"
        case .senseOfTaste:
            return "(sense of taste)"
        case .senseOfSmell:
            return "(sense of smell)"
        case .senseOfHearing:
            return "(sense of hearing)"
        case .senseOfSight:
            return "(sense of sight)"
        }
    }
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
        switch self {
        case .hisFault:
            return hisFaultItems
        case .herFault:
            return []
        case .myFault:
            return myFaultItems
        case .toxic:
            return toxicChatItems
        case .giving:
            return []
        case .receiving:
            return receivingTalkItems
        case .sweet:
            return sweetTalkItems
        }
    }
    
    var myFaultItems: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                type: .admit,
                fromGenderTitle: "He complained:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .apologize,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .firstAppreciation,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .commitToChange,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .askForgiveness,
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
                type: .soothingCycle,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .feelFeltFindingOut,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .secondAppreciation,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .reconnect,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            )
        ]
    }
    
    var hisFaultItems: [DoItYourSelfStoryFormItem] {
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
    
    var toxicChatItems: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                type: .admit,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .apologize,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .firstAppreciation,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .commitToChange,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .askForgiveness,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .heartFeeling,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .bodyFeeling,
                fromGenderTitle: "He said:",
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
                type: .givePermission,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .takeYourFeelingsForAWalk,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            )
        ]
    }
    
    var receivingTalkItems: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                type: .heartFeeling,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .bodyFeeling,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .thankYouMessages,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .appreciationMessages,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .admirationMessages,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .respectMessages,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            )
        ]
    }
    
    var sweetTalkItems: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                type: .heartFeeling,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .bodyFeeling,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .senseOfTouch,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .senseOfTaste,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .senseOfSmell,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .senseOfHearing,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            ),
            .init(
                type: .senseOfSight,
                fromGenderTitle: "He said:",
                userSaidTitle: "I said:",
                fromGenderSaid: "",
                userSaid: ""
            )
        ]
    }
}
