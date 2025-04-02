//
//  StepsForFemale.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 31/03/25.
//

import Foundation

extension StoryType {
    var stepsForMale: [DoItYourSelfStoryFormItemType] {
        switch self {
        case .hisFault:
            return []
        case .herFault:
            return [
                .heartFeelingOrFact,
                .bodyFeeling,
                .negativeSelfFeelingStatement,
                .callToAction,
                .clarification,
                .appreciation
            ]
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
            return [
                .courtHer,
                .respectHer,
                .makePlans,
                .beOnTime,
                .protectHer,
                .bringGifts,
                .complementHer,
                .showSincereInterestInHerFamily,
                .helpAroundTheHouse,
                .spendTimeWithHer
                
            ]
        case .receiving:
            return []
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
    
    var stepsViewHeaderForMale: String {
        switch self {
        case .hisFault:
            return "" //
        case .herFault:
            return "She did or said something wrong. Memorize the 6 steps below to lovingly call him out:"
        case .myFault:
            return "I say or do something wrong. Memorize the 10 steps below to lovingly allow him to call me out:"
        case .toxic:
            return "I say or do something wrong. Use the 10 my-fault toxic chat messages"
        case .giving:
            return "Here are ways for men to give from their heart."
        case .receiving:
            return "" //
        case .sweet:
            return "When sweet talking, speak from your heart, not your mind. Use the heart/body feelings and five-senses steps below:"
        }
    }
}

