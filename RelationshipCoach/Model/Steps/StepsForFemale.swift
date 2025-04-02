//
//  StepsForFemale.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 31/03/25.
//

import Foundation

extension StoryType {
    var stepsForFemale: [DoItYourSelfStoryFormItemType] {
        switch self {
        case .hisFault:
            return [
                .heartFeelingOrFact,
                .bodyFeeling,
                .negativeSelfFeelingStatement,
                .callToAction,
                .clarification,
                .appreciation
            ]
        case .herFault:
            return []
        case .myFault:
            return [
                .admit,
                .apologize,
                .firstAppreciation,
                .commitToChange,
                .askForgiveness,
                .clarification,
                .soothingCycle,
                .feelFeltFindingOut,
                .secondAppreciation,
                .reconnect
            ]
        case .toxic:
            return [
                .admit,
                .apologize,
                .appreciation,
                .commitToChange,
                .askForgiveness,
                .heartFeeling,
                .bodyFeeling,
                .negativeSelfFeelingStatement,
                .givePermission,
                .takeYourFeelingsForAWalk
            ]
        case .giving:
            return []
        case .receiving:
            return [
                .heartFeeling,
                .bodyFeeling,
                .thankYouMessages,
                .appreciationMessages,
                .admirationMessages,
                .respectMessages
            ]
        case .sweet:
            return [
                .heartFeeling,
                .bodyFeeling,
                .senseOfTouch,
                .senseOfTaste,
                .senseOfSmell,
                .senseOfHearing,
                .senseOfSight
            ]
        }
    }
    
    var stepsViewHeaderForFemale: String {
        switch self {
        case .hisFault:
            return "He did or said something wrong. Memorize the 6 steps below to lovingly call him out:"
        case .herFault:
            return "" //
        case .myFault:
            return "I say or do something wrong. Memorize the 10 steps below to lovingly allow him to call me out:"
        case .toxic:
            return "I say or do something wrong. Use the 10 my-fault toxic chat messages"
        case .giving:
            return ""//
        case .receiving:
            return "As a woman, you need to be able to receive a compliment or positive action from a man without discounting his compliment tor action."
        case .sweet:
            return "When sweet talking, speak from your heart, not your mind. Use the heart/body feelings and five senses steps below:"
        }
    }
}

