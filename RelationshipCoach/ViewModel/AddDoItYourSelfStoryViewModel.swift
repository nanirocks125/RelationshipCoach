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
    case heartFeelings
    case bodyFeelings
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
    
    // Giving Talk
    case courtHer
    case respectHer
    case beOnTime
    case protectHer
    case bringGifts
    case complementHer
    case sincereInterestInHerFamily
    case helpAroundTheHouse
    case spendTimeWithHer
    
    case none
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
            return "(heart feeling)"
        case .bodyFeeling:
            return "(body feeling)"
        case .heartFeelings:
            return "(heart feelings)"
        case .bodyFeelings:
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
        case .none:
            return ""
        case .courtHer:
            return "(court her)"
        case .respectHer:
            return "(respect her)"
        case .beOnTime:
            return "(be on time)"
        case .protectHer:
            return "(protect her)"
        case .bringGifts:
            return "(bring gifts)"
        case .complementHer:
            return "(complement her)"
        case .sincereInterestInHerFamily:
            return "(sincere interest in her family)"
        case .helpAroundTheHouse:
            return "(help around the house)"
        case .spendTimeWithHer:
            return "(spend time with her)"
        }
    }
}

struct DoItYourSelfStoryFormItem: Codable, Hashable {
    let fromGenderItemType: DoItYourSelfStoryFormItemType
    let userGenderItemType: DoItYourSelfStoryFormItemType
    let fromGenderTitle: String
    let userSaidTitle: String
    var fromGenderSaid: String
    var userSaid: String
    
    init(fromGenderItemType: DoItYourSelfStoryFormItemType = .none,
         userGenderItemType: DoItYourSelfStoryFormItemType = .none,
         fromGenderTitle: String,
         userSaidTitle: String = "I said:",
         fromGenderSaid: String = "",
         userSaid: String = "") {
        self.fromGenderItemType = fromGenderItemType
        self.userGenderItemType = userGenderItemType
        self.fromGenderTitle = fromGenderTitle
        self.userSaidTitle = userSaidTitle
        self.fromGenderSaid = fromGenderSaid
        self.userSaid = userSaid
    }
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
    
    func prepareForm(story: StoryType, doItYourSelfStory: DoItYourSelfStory?, gender: Gender) {
        self.story = story
        if let doItYourSelfStory = doItYourSelfStory {
            self.items = doItYourSelfStory.items
        } else {
            switch gender {
            case .male:
                self.items = story.itemsForMale
            case .female:
                self.items = story.itemsForFemale
            case .none:
                self.items = []
            }
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
    var itemsForMale: [DoItYourSelfStoryFormItem] {
        switch self {
        case .hisFault:
            return []
        case .herFault:
            return herFaultItems
        case .myFault:
            return myFaultItemsForMale
        case .toxic:
            return toxicChatItemsForMale
        case .giving:
            return givingTalkItems
        case .receiving:
            return []
        case .sweet:
            return sweetTalkItemsForMale
        }
    }
    
    var herFaultItems: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                userGenderItemType: .heartFeelingOrFact,
                fromGenderTitle: "She did or said something wrong:"
            ),
            .init(
                userGenderItemType: .negativeSelfFeelingStatement,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .callToAction,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .clarification,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .appreciation,
                fromGenderTitle: "She said:"
            )
        ]
    }
    
    var myFaultItemsForMale: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                userGenderItemType: .admit,
                fromGenderTitle: "She complained:"
            ),
            .init(
                userGenderItemType: .apologize,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .firstAppreciation,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .commitToChange,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .askForgiveness,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .clarification,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .soothingCycle,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .feelFeltFindingOut,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .secondAppreciation,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .reconnect,
                fromGenderTitle: "She said:"
            )
        ]
    }
    
    var toxicChatItemsForMale: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                userGenderItemType: .admit,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .apologize,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .firstAppreciation,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .commitToChange,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .askForgiveness,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .heartFeeling,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .bodyFeeling,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .negativeSelfFeelingStatement,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .givePermission,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .takeYourFeelingsForAWalk,
                fromGenderTitle: "She said:"
            )
        ]
    }
    
    var givingTalkItems: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                fromGenderItemType: .courtHer,
                fromGenderTitle: "You and she get to the car door."
            ),
            .init(
                fromGenderItemType: .respectHer,
                fromGenderTitle: "You see that she did something really brave at work that involved taking up for herself in front of her boss"
            ),
            .init(
                fromGenderItemType: .beOnTime,
                fromGenderTitle: "You have a choice to finish another project at work or be on time to pick her up."
            ),
            .init(
                fromGenderItemType: .protectHer,
                fromGenderTitle: "It's cold outside. She doesn't have a coat, but you do."
            ),
            .init(
                fromGenderItemType: .bringGifts,
                fromGenderTitle: "You know she had a rough day and would like to make her smile"
            ),
            .init(
                fromGenderItemType: .complementHer,
                fromGenderTitle: "You think she looks beautiful"
            ),
            .init(
                fromGenderItemType: .sincereInterestInHerFamily,
                fromGenderTitle: "She has an interesting family and you'd like to meet them."
            ),
            .init(
                fromGenderItemType: .helpAroundTheHouse,
                fromGenderTitle: "She has trouble with her back door not locking properly."
            ),
            .init(
                fromGenderItemType: .spendTimeWithHer,
                fromGenderTitle: "She is free all day Saturday, but you had planned to go to races with the guys."
            )
        ]
    }
    
    var sweetTalkItemsForMale: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                userGenderItemType: .heartFeelings,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .bodyFeelings,
                fromGenderTitle: "She did:"
            ),
            .init(
                userGenderItemType: .senseOfTouch,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .senseOfTaste,
                fromGenderTitle: "She did:"
            ),
            .init(
                userGenderItemType: .senseOfSmell,
                fromGenderTitle: "She said:"
            ),
            .init(
                userGenderItemType: .senseOfHearing,
                fromGenderTitle: "She did:"
            ),
            .init(
                userGenderItemType: .senseOfSight,
                fromGenderTitle: "She said:"
            )
        ]
    }
    
    var itemsForFemale: [DoItYourSelfStoryFormItem] {
        switch self {
        case .hisFault:
            return hisFaultItems
        case .herFault:
            return []
        case .myFault:
            return myFaultItemsForFemale
        case .toxic:
            return toxicChatItemsForFemale
        case .giving:
            return []
        case .receiving:
            return receivingTalkItems
        case .sweet:
            return sweetTalkItemsForFemale
        }
    }
    
    var myFaultItemsForFemale: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                userGenderItemType: .admit,
                fromGenderTitle: "He complained:"
            ),
            .init(
                userGenderItemType: .apologize,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .firstAppreciation,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .commitToChange,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .askForgiveness,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .clarification,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .soothingCycle,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .feelFeltFindingOut,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .secondAppreciation,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .reconnect,
                fromGenderTitle: "He said:"
            )
        ]
    }
    
    var hisFaultItems: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                userGenderItemType: .heartFeelingOrFact,
                fromGenderTitle: "He did or said something wrong:"
            ),
            .init(
                userGenderItemType: .negativeSelfFeelingStatement,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .callToAction,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .clarification,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .appreciation,
                fromGenderTitle: "He said:"
            )
        ]
    }
    
    var toxicChatItemsForFemale: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                userGenderItemType: .admit,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .apologize,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .firstAppreciation,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .commitToChange,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .askForgiveness,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .heartFeeling,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .bodyFeeling,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .negativeSelfFeelingStatement,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .givePermission,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .takeYourFeelingsForAWalk,
                fromGenderTitle: "He said:"
            )
        ]
    }
    
    var receivingTalkItems: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                userGenderItemType: .heartFeeling,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .bodyFeeling,
                fromGenderTitle: "He did:"
            ),
            .init(
                userGenderItemType: .thankYouMessages,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .appreciationMessages,
                fromGenderTitle: "He did:"
            ),
            .init(
                userGenderItemType: .admirationMessages,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .respectMessages,
                fromGenderTitle: "He did:"
            )
        ]
    }
    
    var sweetTalkItemsForFemale: [DoItYourSelfStoryFormItem] {
        return [
            .init(
                userGenderItemType: .heartFeeling,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .bodyFeeling,
                fromGenderTitle: "He did:"
            ),
            .init(
                userGenderItemType: .senseOfTouch,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .senseOfTaste,
                fromGenderTitle: "He did:"
            ),
            .init(
                userGenderItemType: .senseOfSmell,
                fromGenderTitle: "He said:"
            ),
            .init(
                userGenderItemType: .senseOfHearing,
                fromGenderTitle: "He did:"
            ),
            .init(
                userGenderItemType: .senseOfSight,
                fromGenderTitle: "He said:"
            )
        ]
    }
}
