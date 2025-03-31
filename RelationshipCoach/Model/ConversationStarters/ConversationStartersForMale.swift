//
//  ConversationStartersForMale.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 31/03/25.
//

import Foundation

extension StoryType {
    var coachingStartersForMale: [ConversationStarter] {
        switch self {
        case .hisFault:
            return []
        case .herFault:
            return herFaultConversationStarters //herFaultStories
        case .myFault:
            return myFaultConversationStartersForMale //myFaultStoriesForMale
        case .toxic:
            return toxicChatConversationStartersForMale //toxicChatStoriesForMale
        case .giving:
            return givingTalkConversationStarters //givingTalkStories
        case .receiving:
            return []
        case .sweet:
            return sweetTalkConversationStartersForMale //sweetTalkStoriesForMale
        }
    }
    
    var herFaultConversationStarters: [ConversationStarter] {
        return [
            .init(
                title: "Heart Feeling/fact",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .heartFeeling("I felt sad"),
                            .fact(" when I was by myself.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .heartFeeling("I'm feeling angry"),
                            .fact("about being alone.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .heartFeeling("I felt frustrated"),
                            .fact("when that happened.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .heartFeeling("I felt unimportant"),
                            .fact("when I was left out.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .heartFeeling("I felt a little insecure"),
                            .fact("when I saw that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
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
                        genderSource: .male,
                        items: [
                            .none("My chest feels tight.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("My palms are sweaty.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("My stomach is in knots.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("My throat gets tight.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("My body felt shaky.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
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
                        genderSource: .male,
                        items: [
                            .none("This sad feeling doesn't feel good.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I don't like feeling angry.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("It doesn't feel good to feel frustrated.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I feel bad about feeling overlooked.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I don't like feeling insecure.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
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
                        genderSource: .male,
                        items: [
                            .none("How do you think we could make this better?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("What do you think we can do to be closer?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("How can we understand each other better so we can connect on a deeper level?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("How can we make this right?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("What can we do to feel better about this?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
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
                        genderSource: .male,
                        items: [
                            .none("Help me understand how you feel.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Tell me more.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Help me to clarify what you mean.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Tell me how I can help.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Is there something wrong?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
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
                        genderSource: .male,
                        items: [
                            .none("Thank you for sharing. I appreciate you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you. I appreciate you listening.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you. It means a lot to me to be heard by you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you. I appreciate you agreeing to invite me next time.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you for being open and honest with me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you for sharing that with me. I'm so glad to know that.")
                        ]
                    )
                ]
            )
        ]
    }
    
    var myFaultConversationStartersForMale: [ConversationStarter] {
        return [
            .init(
                title: "Admit",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I admit that I said that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I admit that I felt that way.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I admit that I said that about you."),
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I agree with you. I said that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I admit that I did that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I admit that I was wrong."),
                        ]
                    )
                ]
            ),
            .init(
                title: "Apologize",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I apologize for saying that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I apologize for speaking to you that way.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I apologize for telling my friends that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I apologize for embarrassing you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I apologize for leaving you out.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I apologize for being late.")
                        ]
                    )
                ]
            ),
            .init(
                title: "First Appreciation",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you for letting me know how you feel.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you for opening up to me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you for being honest with me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you for listening.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I appreciate you being here for me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you for making me feel safe with you.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Commit-to-Change",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I commit-to-change the way I talk about you to other people.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I commit to be on time")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I commit-to-change by including you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I commit to call you when I say I will.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I have decided not to say that anymore")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("It's important to me that you feel special, so I commit to not doing that any more.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Ask Forgiveness",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Please forgive me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Please excuse my behavior.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I'm asking you to forgive me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Please know that I would love your forgiveness.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Please consider forgiving me.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Clarification",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Is there anything else bothering you?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Please tell me more.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Help me to understand.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Help me to understand what you're thinking.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Help me to know your feelings better.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Soothing Cycle (So-You-Feel)",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("So you feel left out and want me to invite you next time?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("So you felt like I didn't pay any attention to you and want me to include you more?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("So you are feeling angry because I didn't follow through, and would like for me to do what I say I'm going to do?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("So you felt abandoned when I left early, and want me to wait for you?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("So you felt unloved when I said that and want me to think before I speak?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("So you felt sad to experience that, and want me to change the way I handle those situations?")
                        ]
                    )
                ]
            ),
            .init(
                title: "Feel-Felt-Finding-Out",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I know how you feel, I have felt the same way before, but what I'm finding out is that I'm not very good about remembering birthdays and I will change that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I know how you feel, I felt scared at first too, but what I found out was that I just didn't know how to express myself to you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I know how you felt, I have felt unloved before too, but what I'm finding out is that I need to show you that I care.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I know how you must feel, I have felt angry about those things too, but what I'm finding out is that I was just afraid, and I didn't need to be. Neither do you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I understand how you feel. I have felt the same way but what I found out is that we all want the same things.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I gotcha. I am seeing how you feel. I have felt that way too, but what I'm finding out is there is a solution.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Second Appreciation",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I appreciate you sharing that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you for sharing.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I appreciate you being honest with me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I appreciate you and feel much closer to you now that you shared that with me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you for your openness.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I appreciate everything about you.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Reconnect",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Face each other and match each others' breath while breathing slowly.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Look each other in the eye and hold the gaze for 10 seconds at a time. Repeat 4 times.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Stand and slow dance together.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Give each other a shoulder or back massage.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Share 5 things that each appreciates about the other.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Listen to music that both people enjoy.")
                        ]
                    )
                ]
            )
        ]
    }
    
    var toxicChatConversationStartersForMale: [ConversationStarter] {
        return [
            .init(
                title: "Admit",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Yes, that's my fault")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Yes, I did that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I admit that I did that."),
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I admit that I caused that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I agree that it is my fault.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I admit that I made a mistake."),
                        ]
                    )
                ]
            ),
            .init(
                title: "Apologize",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I apologize for that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I am sincerely sorry I did that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I am really sorry I did that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I am so sorry I said that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I apologize for doing that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I apologize for acting that way.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Appreciation",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I appreciate you doing that for me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I appreciate you helping me with that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I appreciate you taking the time to call me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I appreciate knowing your thoughts.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I appreciate you taking care of that problem for me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I appreciate you sharing that with me.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Commit-to-Change",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I commit-to-change the way I do that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I commit-to-change the way I say that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I commit-to-change the way I act around you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I commit-to-change my attitude.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I commit-to-change my view about that.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Ask Forgiveness",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I ask for you to forgive me for that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I ask that you please forgive me for saying that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I am asking you to forgive me for being that way.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I ask your forgiveness for doing that.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I ask you to please forgive me for acting that way.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Heart Feeling",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I feel angry.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I'm feeling embarrassed.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I'm feeling stupid.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I'm feeling sad.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I'm feeling abandoned.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I feel left out.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Body Feeling",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("My chest hurts.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("My palms are sweaty.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("My heart is beating faster.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("My neck is tight.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("My back hurts.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("My knees are weak.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Negative Self-Feeling Statement",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("It hurts to feel this way.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I don't like this feeling that I'm having.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I feel funny having this feeling.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I don't like feeling this way.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("It doesn't feel good to feel this way.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("This feels terrible to feel so mad.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Give Permission",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("You can say whatever you want.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("You can say that if you want.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("You can say that to me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("You have the freedom to talk to me any way you want.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("You can talk to me however you want.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Take You Feelings for a Walk",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I can't listen to it anymore.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I won't listen to this anymore.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I am not listening to this anymore.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I am not willing to stand here and listen anymore.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I will not listen to this anymore.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I am not going to listen to this anymore.")
                        ]
                    )
                ]
            )
        ]
    }
    
    var givingTalkConversationStarters: [ConversationStarter] {
        return [
            .init(
                title: "Court Her",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Open the door.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Gently place your hand on her back to guide her into a room.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Treat her the way you would like someone to treat your sister, mom, or grandmother."),
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Stand up when she approaches in a public setting.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Stand up when she leaves the table in a public setting.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Be polite (no curse words)."),
                        ]
                    )
                ]
            ),
            .init(
                title: " Respect Her",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Take time to get to know her likes and dislikes.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Be patient about getting physical.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Treat her with care and honor her in private.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Treat her with care and honor her in front of others.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Genuinely find good things to like about her family.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Ask her permission before making major decisions.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Make Plans",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Plan dates.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Plan activities that are outside the norm.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Surprise her with a fun activity.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Research before you make a decision on a date.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Take time to call ahead or book reservations online.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Buy tickets for her favorite concert well in advance.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Be On Time",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Arrive to her place on time so she knows that she is important to you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Leave your house or office early enough to be 5 minutes early to her house.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Set your alarm to notify you when it's time to leave.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Leave work unfinished so you can get to your date on time.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Plan your schedule ahead so that you arrive on time")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Cut something out of your schedule so that you don't run the risk of being late.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Protect Her",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("If it is raining, cover her up with your jacket.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("If you sense someone trying to make fun of her, come to her rescue.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("If her car is not working properly, offer to take her to work")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("If she appears scared, soothe her.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("If she is not strong enough to lift something, do it for her.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("If she is tired, let her rest.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Bring Gifts",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Bring flowers.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Bring her favorite candy.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Blindfold her, then present her with one of her favorite things.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Bring her a special card for no special reason.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Bring her your smile.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Bring her something silly to make her laugh.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Compliment Her",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Tell her she is beautiful.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Tell her she is smart.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Tell her she is sexy.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Tell her she is the best.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Tell her she makes you happy.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Tell her she is charming.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Show sincere interest in her family",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Wonder, don't judge about any issues happening with her family.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Ask her to share her family history with you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Ask her to share funny stories of her family with you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Ask her who her favorite family members are.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Ask to meet her family.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Help around the house",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Fix things that break around the house.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Change light bulbs.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Help her with her chores.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Help with the outside.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Help with the vacuuming.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Spend time with her",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Spend time in the morning before you leave for work by getting up earlier.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Spend time talking to her during the day when you aren't looking at your phone so you can give her your full attention.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Spend time looking at her eyes so you can see how she's feeling.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Spend time listening to what's important to her.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Spend time sharing what's important to both of you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Spend time holding her.")
                        ]
                    )
                ]
            )
        ]
    }
    
    var sweetTalkConversationStartersForMale: [ConversationStarter] {
        return [
            .init(
                title: "Heart Feeling",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I am feeling great.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I feel exhilarated.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I felt luscious."),
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I felt happy.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I felt good.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Body Feeling",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I feel dizzy.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I'm feeling my stomach fluttering.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I felt my palms sweating.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I feel my heart pounding.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I feel my face soften.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I felt my arms loosen.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Sense of Touch",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I felt goosebumps when we held hands.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I feel your warmth when we touch.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I am feeling a warm sensation when you touch me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I feel loved when we touch.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I feel alive with your touch.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Sense of Taste",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I can taste your lips on mine.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I can taste the sweetness of your skin.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I taste the beauty of your lips")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I taste the elegance of your neck.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I can taste the sweetness of lips.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I can taste the essence of who you are.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Sense of Smell",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I can smell the night air in your hair.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I can smell the fragrance of flowers on your neck.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I can sense the smell of orange blossoms just standing next to you")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I like the way you smell.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I smell your sweetness as you hug me.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Sense of Hearing",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I hear the mountain breeze in your waving hair.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I hear the lovely sound of a whippoorwill in your voice.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Your voice sounds so sweet when you sing.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I hear your voice in the breeze.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I hear the longing of my soul to be with you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I am hearing your sounds of love just by being next to you.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Sense of Sight",
                statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I see my future in you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I see your lovely eyes looking back at me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I see your beautiful body in the mirror.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I can see your love shining through your eyes.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I see the warmth of your heart.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I see the love inside of you.")
                        ]
                    )
                ]
            )
        ]
    }
}
