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
    
    func prepareData(for gender: Gender) {
        realLifeStories = [
            .init(title: "He said he'd call, but didn't",
                  authorGender: gender,
                  statements: [
                    .init(
                        genderSource: .female,
                        items: [.heartFeeling("I felt sad"),
                                .fact("When I didn't get a phone call")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.none("Well, I had to work late.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.bodyFeeling("Yes, I know, but my chest is tightening up talking about this."),
                                .negativeSelfFeeling("I don't like feeling this way."),
                                .callToAction("How do you think we can make this better?")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.none("Well, you're right. I should have called you. I'm sorry. I'll try to be more conscious of it.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.clarification("Help me understand what you mean when you say that.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.none("Well, I will call you when I say I will.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.appreciation("Thank you. I appreciate you so much.")]
                    )
                  ]),
            .init(title: "He didn't invite you to the family reunion",
                  authorGender: gender,
                  statements: [
                    .init(
                        genderSource: .female,
                        items: [.heartFeeling("I felt icky"),
                                .fact("about not getting invited to the family reunion.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.none("Well, it wasn't that much fun anyway.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.heartFeeling("I felt unimportant"),
                                .negativeSelfFeeling("when I wasn't invited and that doesn't feel good."),
                                .bodyFeeling("My chest feels tight"),
                                .callToAction("talking to you about this. How do you think we could make this better?")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.none("Well, I'll be more considerate of your feelings next time.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.clarification("Help me understand a little better.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.none("I'll include you in the next family reunion.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.appreciation("Thank you.")]
                    )
                  ])
        ]
    }
}
