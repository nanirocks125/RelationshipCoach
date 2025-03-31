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
}

