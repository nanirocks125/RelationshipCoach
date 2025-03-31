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
}

