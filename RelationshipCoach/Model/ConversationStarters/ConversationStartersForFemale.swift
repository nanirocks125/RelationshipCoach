//
//  RealLifeExampleStoriesForFemale.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 31/03/25.
//

import Foundation

extension StoryType {
   
    
    var coachingStartersForFemale: [ConversationStarter] {
        switch self {
        case .hisFault:
            return hisFaultConversationStarters
        case .herFault:
            return []
        case .myFault:
            return myFaultConversationStartersForFemale
        case .toxic:
            return toxicChatConversationStartersForFemale
        case .giving:
            return []
        case .receiving:
            return receivingTalkConversationStarters
        case .sweet:
            return sweetTalkConversationStartersForFemale
        }
    }
    
    var hisFaultConversationStarters: [ConversationStarter] {
        return [
            .init(
                title: "Heart Feeling/fact",
                statements: [
                    .init(
                        genderSource: .female,
                        items: [
                            .heartFeeling("I felt sad"),
                            .fact(" when I was by myself.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .heartFeeling("I'm feeling angry"),
                            .fact("about being alone.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .heartFeeling("I felt frustrated"),
                            .fact("when that happened.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .heartFeeling("I felt unimportant"),
                            .fact("when I was left out.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .heartFeeling("I felt a little insecure"),
                            .fact("when I saw that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("My chest feels tight.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("My palms are sweaty.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("My stomach is in knots.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("My throat gets tight.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("My body felt shaky.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("This sad feeling doesn't feel good.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I don't like feeling angry.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("It doesn't feel good to feel frustrated.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I feel bad about feeling overlooked.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I don't like feeling insecure.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("How do you think we could make this better?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("What do you think we can do to be closer?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("How can we understand each other better so we can connect on a deeper level?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("How can we make this right?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("What can we do to feel better about this?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Help me understand how you feel.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Tell me more.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Help me to clarify what you mean.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Tell me how I can help.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Is there something wrong?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Thank you for sharing. I appreciate you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you. I appreciate you listening.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you. It means a lot to me to be heard by you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you. I appreciate you agreeing to invite me next time.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you for being open and honest with me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you for sharing that with me. I'm so glad to know that.")
                        ]
                    )
                ]
            )
        ]
    }
    
    var myFaultConversationStartersForFemale: [ConversationStarter] {
        return [
            .init(
                title: "Admit",
                statements: [
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I admit that I said that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I admit that I felt that way.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I admit that I said that about you."),
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I agree with you. I said that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I admit that I did that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I apologize for saying that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I apologize for speaking to you that way.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I apologize for telling my friends that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I apologize for embarrassing you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I apologize for leaving you out.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I apologize for being late.")
                        ]
                    )
                ]
            ),
            .init(
                title: "Appreciation",
                statements: [
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you for letting me know how you feel.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you for opening up to me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you for being honest with me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you for listening.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I appreciate you being here for me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I commit-to-change the way I talk about you to other people.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I commit to be on time")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I commit-to-change by including you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I commit to call you when I say I will.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I have decided not to say that anymore")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Please forgive me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Please excuse my behavior.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I'm asking you to forgive me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Please know that I would love your forgiveness.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Is there anything else bothering you?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Please tell me more.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Help me to understand.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Help me to understand what you're thinking.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("So you feel left out and want me to invite you next time?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("So you felt like I didn't pay any attention to you and want me to include you more?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("So you are feeling angry because I didn't follow through, and would like for me to do what I say I'm going to do?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("So you felt abandoned when I left early, and want me to wait for you?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("So you felt unloved when I said that and want me to think before I speak?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I know how you feel, I have felt the same way before, but what I'm finding out is that I'm not very good about remembering birthdays and I will change that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I know how you feel, I felt scared at first too, but what I found out was that I just didn't know how to express myself to you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I know how you felt, I have felt unloved before too, but what I'm finding out is that I need to show you that I care.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I know how you must feel, I have felt angry about those things too, but what I'm finding out is that I was just afraid, and I didn't need to be. Neither do you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I understand how you feel. I have felt the same way but what I found out is that we all want the same things.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I appreciate you sharing that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you for sharing.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I appreciate you being honest with me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I appreciate you and feel much closer to you now that you shared that with me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you for your openness.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Face each other and match each others' breath while breathing slowly.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Look each other in the eye and hold the gaze for 10 seconds at a time. Repeat 4 times.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Stand and slow dance together.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Give each other a shoulder or back massage.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Share 5 things that each appreciates about the other.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Listen to music that both people enjoy.")
                        ]
                    )
                ]
            )
        ]
    }
    
    var toxicChatConversationStartersForFemale: [ConversationStarter] {
        return [
            .init(
                title: "Admit",
                statements: [
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Yes, that's my fault")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Yes, I did that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I admit that I did that."),
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I admit that I caused that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I agree that it is my fault.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I apologize for that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I am sincerely sorry I did that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I am really sorry I did that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I am so sorry I said that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I apologize for doing that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I appreciate you doing that for me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I appreciate you helping me with that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I appreciate you taking the time to call me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I appreciate knowing your thoughts.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I appreciate you taking care of that problem for me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I commit-to-change the way I do that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I commit-to-change the way I say that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I commit-to-change the way I act around you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I commit-to-change my attitude.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I ask for you to forgive me for that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I ask that you please forgive me for saying that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I am asking you to forgive me for being that way.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I ask your forgiveness for doing that.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I feel angry.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I'm feeling embarrassed.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I'm feeling stupid.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I'm feeling sad.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I'm feeling abandoned.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("My chest hurts.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("My palms are sweaty.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("My heart is beating faster.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("My neck is tight.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("My back hurts.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("It hurts to feel this way.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I don't like this feeling that I'm having.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I feel funny having this feeling.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I don't like feeling this way.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("It doesn't feel good to feel this way.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("You can say whatever you want.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("You can say that if you want.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("You can say that to me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("You have the freedom to talk to me any way you want.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I can't listen to it anymore.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I won't listen to this anymore.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I am not listening to this anymore.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I am not willing to stand here and listen anymore.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I will not listen to this anymore.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I am not going to listen to this anymore.")
                        ]
                    )
                ]
            )
        ]
    }
    
    var receivingTalkConversationStarters: [ConversationStarter] {
        return [
            .init(
                title: "Court Her",
                statements: [
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Open the door.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Gently place your hand on her back to guide her into a room.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Treat her the way you would like someone to treat your sister, mom, or grandmother."),
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Stand up when she approaches in a public setting.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Stand up when she leaves the table in a public setting.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Take time to get to know her likes and dislikes.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Be patient about getting physical.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Treat her with care and honor her in private.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Treat her with care and honor her in front of others.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Genuinely find good things to like about her family.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Plan dates.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Plan activities that are outside the norm.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Surprise her with a fun activity.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Research before you make a decision on a date.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Take time to call ahead or book reservations online.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Arrive to her place on time so she knows that she is important to you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Leave your house or office early enough to be 5 minutes early to her house.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Set your alarm to notify you when it's time to leave.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Leave work unfinished so you can get to your date on time.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Plan your schedule ahead so that you arrive on time")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("If it is raining, cover her up with your jacket.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("If you sense someone trying to make fun of her, come to her rescue.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("If her car is not working properly, offer to take her to work")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("If she appears scared, soothe her.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("If she is not strong enough to lift something, do it for her.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Bring flowers.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Bring her favorite candy.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Blindfold her, then present her with one of her favorite things.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Bring her a special card for no special reason.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Bring her your smile.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Tell her she is beautiful.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Tell her she is smart.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Tell her she is sexy.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Tell her she is the best.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Tell her she makes you happy.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Wonder, don't judge about any issues happening with her family.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Ask her to share her family history with you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Ask her to share funny stories of her family with you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Ask her who her favorite family members are.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Fix things that break around the house.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Change light bulbs.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Help her with her chores.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Help with the outside.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("Spend time in the morning before you leave for work by getting up earlier.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Spend time talking to her during the day when you aren't looking at your phone so you can give her your full attention.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Spend time looking at her eyes so you can see how she's feeling.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Spend time listening to what's important to her.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Spend time sharing what's important to both of you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Spend time holding her.")
                        ]
                    )
                ]
            )
        ]
    }
    
    var sweetTalkConversationStartersForFemale: [ConversationStarter] {
        return [
            .init(
                title: "Heart Feeling",
                statements: [
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I am feeling great.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I feel exhilarated.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I felt luscious."),
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I felt happy.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I feel dizzy.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I'm feeling my stomach fluttering.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I felt my palms sweating.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I feel my heart pounding.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I feel my face soften.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I felt goosebumps when we held hands.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I feel your warmth when we touch.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I am feeling a warm sensation when you touch me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I feel loved when we touch.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I can taste your lips on mine.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I can taste the sweetness of your skin.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I taste the beauty of your lips")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I taste the elegance of your neck.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I can taste the sweetness of your lips.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I can smell the night air in your hair.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I can smell the fragrance of flowers on your neck.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I can sense the smell of orange blossoms just standing next to you")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I like the way you smell.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I hear the mountain breeze in your waving hair.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I hear the lovely sound of a whippoorwill in your voice.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Your voice sounds so sweet when you sing.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I hear your voice in the breeze.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I hear the longing of my soul to be with you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
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
                        genderSource: .female,
                        items: [
                            .none("I see my future in you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I see your lovely eyes looking back at me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I see your beautiful body in the mirror.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I can see your love shining through your eyes.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I see the warmth of your heart.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I see the love inside of you.")
                        ]
                    )
                ]
            )
        ]
    }
    
}

