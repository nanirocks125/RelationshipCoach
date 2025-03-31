//
//  RealLifeExamplesViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation


enum StoryStatementType {
    case heartFeeling(String)
    case bodyFeeling(String)
    case negativeSelfFeeling(String)
    case callToAction(String)
    case clarification(String)
    case appreciation(String)
    case fact(String)
    case none(String)
    
    // Toxic
    case givePermission(String)
    case takeYourFeelingsForAWalk(String)
    case askForgiveness(String)
    case commitToChange(String)
    case apologize(String)
    case admit(String)
    
    case firstAppreciation(String)
    
    // MyFault
    
    case soothingCycle(String)
    case noBlameShameEntitlementOrDefensive(String)
    case feelFeltFindingOut(String)
    case apologizeAgain(String)
    case askForgivenessAgain(String)
    case secondAppreciation(String)
    case reconnect(String)
    case secondClarification(String)
    
    case respectMessage(String)
    case admirationMessage(String)
    case appreciationMessage(String)
    case thankYouWithOutFalseSenseOfUrgency(String)
    
    case senseOfSight(String)
    case senseOfSmell(String)
    case senseOfTouch(String)
}

extension StoryStatementType {
    var description: String {
        switch self {
        case .heartFeeling(let string),
                .bodyFeeling(let string),
                .negativeSelfFeeling(let string),
                .callToAction(let string),
                .clarification(let string),
                .appreciation(let string),
                .fact(let string),
                .givePermission(let string),
                .takeYourFeelingsForAWalk(let string),
                .askForgiveness(let string),
                .commitToChange(let string),
                .apologize(let string),
                .admit(let string),
                .firstAppreciation(let string),
                .soothingCycle(let string),
                .noBlameShameEntitlementOrDefensive(let string),
                .feelFeltFindingOut(let string),
                .apologizeAgain(let string),
                .askForgivenessAgain(let string),
                .secondAppreciation(let string),
                .reconnect(let string),
                .secondClarification(let string),
                .respectMessage(let string),
                .admirationMessage(let string),
                .appreciationMessage(let string),
                .thankYouWithOutFalseSenseOfUrgency(let string),
                .senseOfSight(let string),
                .senseOfSmell(let string),
                .senseOfTouch(let string),
                .none(let string):
            return string
        }
    }
    var displayString: String {
        switch self {
        case .heartFeeling:
            return "(heart feeling)"
        case .bodyFeeling:
            return "(body feeling)"
        case .negativeSelfFeeling:
            return "(negative self-feeling statement)"
        case .callToAction:
            return "(call-to-action)"
        case .clarification:
            return "(clarification)"
        case .appreciation:
            return "(appreciation)"
        case .fact:
            return "(fact)"
        case .none:
            return ""
        case .givePermission(_):
            return "(give permission)"
        case .takeYourFeelingsForAWalk(_):
            return "(take your feelings for a walk)"
        case .askForgiveness(_):
            return "(ask forgiveness)"
        case .commitToChange(_):
            return "(commit-to-change)"
        case .apologize(_):
            return "(apologize)"
        case .admit(_):
            return "(admit)"
        case .firstAppreciation(_):
            return "(first appreciation)"
        case .soothingCycle(_):
            return "(soothing cycle so-you-feel)"
        case .noBlameShameEntitlementOrDefensive(_):
            return "(no blame, shame, entitlement or defensiveness)"
        case .feelFeltFindingOut(_):
            return "(feel felt finding out)"
        case .apologizeAgain(_):
            return "(apologize again)"
        case .askForgivenessAgain(_):
            return "(ask forgiveness again)"
        case .secondAppreciation(_):
            return "(second appreciation)"
        case .reconnect(_):
            return "(reconnect)"
        case .secondClarification(_):
            return "(second clarification)"
        case .respectMessage(_):
            return "(respect message)"
        case .admirationMessage(_):
            return "(admiration message)"
        case .appreciationMessage(_):
            return "(appreciation message)"
        case .thankYouWithOutFalseSenseOfUrgency(_):
            return "(thank you message - without the \"false sense of urgency\" to return the compliment)"
        case .senseOfSight(_):
            return "(sense of sight)"
        case .senseOfSmell(_):
            return "(sense of smell)"
        case .senseOfTouch(_):
            return "(sense of touch)"
        }
    }
}

struct StoryStatement {
    let genderSource: Gender
    let items: [StoryStatementType]
}


struct Story {
    let title: String
    let authorGender: Gender
    let statements: [StoryStatement]
}

class RealLifeExamplesViewModel: ObservableObject {
    @Published var realLifeStories: [Story] = []
    init() {
        
    }
    
    func prepareData(for gender: Gender, story: StoryType) {
        switch gender {
        case .male:
            self.realLifeStories = story.examplesForMale
        case .female:
            self.realLifeStories = story.examplesForFemale
        case .none:
            self.realLifeStories = []
        }
    }
}

