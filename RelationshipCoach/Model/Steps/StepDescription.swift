//
//  StepDescription.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 31/03/25.
//

import Foundation

extension DoItYourSelfStoryFormItemType {
    var stepDescription: String {
        switch self {
        case .clarification:
            return "Clarification"
        case .heartFeelingOrFact:
            return "Heart Feeling/Fact"
        case .negativeSelfFeelingStatement:
            return "Negative Self-Feeling Statement"
        case .callToAction:
            return "Call to Action"
        case .appreciation:
            return "Appreciation"
        case .admit:
            return "Admit"
        case .apologize:
            return "Apologize"
        case .firstAppreciation:
            return "Appreciation"
        case .commitToChange:
            return "Commit-to-Change"
        case .askForgiveness:
            return "Ask Forgiveness"
        case .soothingCycle:
            return "Soothing Cycle (So-You-Feel)"
        case .feelFeltFindingOut:
            return "Feel-Felt-Finding-Out"
        case .secondAppreciation:
            return "Second Appreciation"
        case .reconnect:
            return "Reconnect"
        case .heartFeeling:
            return "Heart Feeling"
        case .bodyFeeling:
            return "Body Feeling"
        case .heartFeelings:
            return "Heart Feelings"
        case .bodyFeelings:
            return "Body Feelings"
        case .givePermission:
            return "Give Permission"
        case .takeYourFeelingsForAWalk:
            return "Take Your Feelings for a Walk"
        case .thankYouMessages:
            return "Thank You Message"
        case .appreciationMessages:
            return "Appreciation Message"
        case .admirationMessages:
            return "Admiration Message"
        case .respectMessages:
            return "Respect Message"
        case .senseOfTouch:
            return "Sense of Touch"
        case .senseOfTaste:
            return "Sense of Taste"
        case .senseOfSmell:
            return "Sense of Smell"
        case .senseOfHearing:
            return "Sense of Hearing"
        case .senseOfSight:
            return "Sense of Sight"
        case .courtHer:
            return "Court Her"
        case .respectHer:
            return "Respect Her"
        case .beOnTime:
            return "Be On Time"
        case .protectHer:
            return "Protect Her"
        case .bringGifts:
            return "Bring Gifts"
        case .complementHer:
            return "Complement Her"
        case .sincereInterestInHerFamily:
            return "Sincere Interest In Her Family"
        case .helpAroundTheHouse:
            return "Help around the house"
        case .spendTimeWithHer:
            return "Spend Time With Her"
        case .makePlans:
            return "Make Plans"
        case .showSincereInterestInHerFamily:
            return "Show sincere interest in her family"
        case .none:
            return ""
        case .bodyFeeling_NegativeSelfFeelingStatement_CallToAction:
            return ""
        case .admit_apologize_appreciation_commitToChange_askForgiveness:
            return ""
        case .bodyFeeling_negativeSelfFeelingStatement:
            return ""
        case .givePermission_takeYourFeelingsForAWalk:
            return ""
        }
    }
}
