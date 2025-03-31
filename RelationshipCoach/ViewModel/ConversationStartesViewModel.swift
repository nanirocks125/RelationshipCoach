//
//  ConversationStartesViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation

struct ConversationStarter {
    let title: String
    let statements: [StoryStatement]
}

class ConversationStartesViewModel: ObservableObject {
    @Published var conversationStarters: [ConversationStarter] = []
    
    init() {
        
    }
    
    
    func prepareData(for gender: Gender, story: StoryType) {
        conversationStarters = [
            .init(
                title: "Heart Feeling/fact",
                statements: [
                    .init(
                        genderSource: gender,
                        items: [
                            .heartFeeling("I felt sad"),
                            .fact(" when I was by myself.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .heartFeeling("I'm feeling angry"),
                            .fact("about being alone.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .heartFeeling("I felt frustrated"),
                            .fact("when that happened.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .heartFeeling("I felt unimportant"),
                            .fact("when I was left out.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .heartFeeling("I felt a little insecure"),
                            .fact("when I saw that.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .heartFeeling("I'm feeling nervous"),
                            .fact("about this.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Body Feeling",
                statements: [
                    .init(
                        genderSource: gender,
                        items: [
                            .none("My chest feels tight.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("My palms are sweaty.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("My stomach is in knots.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("My throat gets tight.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("My body felt shaky.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("My eyes feel teary.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Negative self-feeling statement",
                statements: [
                    .init(
                        genderSource: gender,
                        items: [
                            .none("This sad feeling doesn't feel good.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("I don't like feeling angry.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("It doesn't feel good to feel frustrated.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("I feel bad about feeling overlooked.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("I don't like feeling insecure.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("I feel funny when I feel nervous like this.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Call to Action",
                statements: [
                    .init(
                        genderSource: gender,
                        items: [
                            .none("How do you think we could make this better?")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("What do you think we can do to be closer?")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("How can we understand each other better so we can connect on a deeper level?")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("How can we make this right?")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("What can we do to feel better about this?")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("How can we figure this out together?")
                        ]
                    )
                ]
            ),
            .init(
                title: "Clarification",
                statements: [
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Help me understand how you feel.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Tell me more.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Help me to clarify what you mean.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Tell me how I can help.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Is there something wrong?")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Are you mad at me?")
                        ]
                    )
                ]
            ),
            .init(
                title: "Appreciation",
                statements: [
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Thank you for sharing. I appreciate you.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Thank you. I appreciate you listening.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Thank you. It means a lot to me to be heard by you.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Thank you. I appreciate you agreeing to invite me next time.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Thank you for being open and honest with me.")
                        ]
                    ),
                    .init(
                        genderSource: gender,
                        items: [
                            .none("Thank you for sharing that with me. I'm so glad to know that.")
                        ]
                    )
                ]
            )
        ]
    }
    
    
}
