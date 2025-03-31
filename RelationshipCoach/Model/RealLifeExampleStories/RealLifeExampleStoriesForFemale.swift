//
//  RealLifeExampleStoriesForFemale.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 31/03/25.
//

import Foundation

extension StoryType {
   
    
    var examplesForFemale: [Story] {
        switch self {
        case .hisFault:
            return hisFaultStories
        case .herFault:
            return []
        case .myFault:
            return myFaultStoriesForFemale
        case .toxic:
            return toxicChatStoriesForFemale
        case .giving:
            return []
        case .receiving:
            return receivingTalkStories
        case .sweet:
            return sweetTalkStoriesForFemale
        }
    }
    
    var hisFaultStories: [Story] {
        return [
            .init(title: "He said he'd call, but didn't",
                  authorGender: .female,
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
                  authorGender: .female,
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
    
    var myFaultStoriesForFemale: [Story] {
        return [
            .init(title: "",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("You didn't pay any attention to me at the party.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .admit("You're right. I didn't pay attention to you at the party."),
                            .apologize("and I'm very sorry."),
                            .firstAppreciation("Thank you for sharing that with me and not hiding your feelings."),
                            .commitToChange("I commit to not doing that again."),
                            .askForgiveness("Would you please forgive me?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Ok, I forgive you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .clarification("Is there anything else bothering you?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Well, yes. I also feel like you take your frustrations from work out on me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .soothingCycle("So you feel"),
                            .noBlameShameEntitlementOrDefensive("like you bear the brunt of my frustrations from work and would like for me to quit taking it out on you?"),
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Yes, you treat me like one of your employees. I have employees too, and I don't treat you like I treat them.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .soothingCycle("So you feel like I treat you like one of my employees and want me to treat you more special?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Yes, that would feel great!")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .clarification("Help me understand a little better.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Well, I feel like you take me for granted ")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .feelFeltFindingOut("Ok. Now I know how you must feel, I have felt that way before and what I'm finding out is that it is more painful to you than I realized."),
                            .apologizeAgain("I'm sorry."),
                            .askForgivenessAgain("I would like to ask for your forgiveness and trust in me from here on out.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Oh honey, I love you and I forgive you. Thank you for listening and understanding my point of view.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .secondAppreciation("You're welcome and thank you for sharing with me."),
                            .reconnect("Why don't you come over here and let me rub your back.")
                        ]
                    )
                  ]),
            .init(title: "",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("You leave the house in such a mess and I always have to pick up after you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .admit("You're right."),
                            .apologize("I have gotten sloppy and I apologize.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Well, I don't know how much longer I can put up with it.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .firstAppreciation("Thank you for telling me how much it bothers you."),
                            .commitToChange("I commit to picking up my mess."),
                            .askForgiveness("Would you please forgive me?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Yes, I forgive you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .clarification("Is there anything else bothering you?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Yes, I cannot get everything done at work by the deadline that's been set and I'm really stressing about it.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .soothingCycle("So you feel under a lot of pressure at work to make your deadline and want me to help make it easier at home?")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Yes, I'm worried that I might lose my job over this.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .secondClarification("Tell me more.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Well, I'm afraid we'd have to move if I lost my job.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .feelFeltFindingOut("I know how you must feel, I've felt pressure at work before, but what I'm finding out")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Yes, I'm worried that I might lose my job over this.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .secondClarification("Tell me more.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Well, I'm afraid we'd have to move if I lost my job.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .feelFeltFindingOut("I know how you must feel, I've felt pressure at work before, but what I'm finding out"),
                            .secondAppreciation("is that you are a smart and dependable man and I know you can do it. Thank you for working so hard. I appreciate you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .none("Thank you honey.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .reconnect("You're welcome. Please sit on the couch with me so I can give you a big hug.")
                        ]
                    ),
                  ]),
        ]
    }
    
    var toxicChatStoriesForFemale: [Story] {
        return [
            .init(title: "",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("You're never ready when I come to pick you up.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("You're never ready when I come to pick you up."),
                                .admit("You're right."),
                                .apologize("I'm sorry."),
                                .appreciation("Thank you for coming to pick me up."),
                                .commitToChange("I commit to being ready next time."),
                                .askForgiveness("Please forgive me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.none("Well, I don't know what you do in there, but it's not working. You look awful!")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.heartFeeling("That feels horrible to hear.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.none("Well, Joey's girlfriend always looks great. Why can't you look like her?")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.bodyFeeling("My stomach is in knots hearing that."),
                                .negativeSelfFeeling("I don't like feeling this way.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.none("Well, you're just a piece of trash!")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.givePermission("You can talk to me any way you want,"),
                                .takeYourFeelingsForAWalk("but hearing that makes me need to leave.")]
                    )
                  ]),
            .init(title: "",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [.none("You didn't call me back yesterday.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.admit("I know. You're right."),
                                .apologize("I apologize for not calling you back."),
                                .appreciation("I appreciate you taking the time to call me when you want to talk."),
                                .commitToChange("I commit to returning your calls."),
                                .askForgiveness("I'd like to ask you to forgive me.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.none("I don't think you deserve forgiveness. You're just a loser and can't remember anything.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.heartFeeling("I feel angry hearing that.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.none("You're always angry. That's what's wrong with you. In fact, there's so much wrong with you that I'm disgusted with you!")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .bodyFeeling("My body is shaking."),
                            .negativeSelfFeeling("This anger and shaking feel terrible."),
                            .givePermission("You are free to talk to me any way you want,"),
                            .takeYourFeelingsForAWalk("I'm happy to talk when it's nice but untill that changes I need to leave."),
                        ]
                    )
                  ])
        ]
    }
    
    var receivingTalkStories: [Story] {
        return [
            .init(title: "",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("You look great.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .heartFeeling("You make me feel close to you when you say those things.")
                        ]
                    )
                  ]
                 ),
            .init(title: "",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("He opened the car door.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .bodyFeeling("You make me feel giddy inside.")
                        ]
                    )
                  ]
                 ),
            .init(title: "",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("You’re the best thing that’s ever happened to me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .thankYouWithOutFalseSenseOfUrgency("Thank you.")
                        ]
                    )
                  ]
                 ),
            .init(title: "",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("He touched my hand.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .appreciationMessage("Thank you. I appreciate you touching my hand.")
                        ]
                    )
                  ]
                 ),
            .init(title: "",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("I want to take care of that situation for you!")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .admirationMessage("I admire you for wanting to take care of me.")
                        ]
                    )
                  ]
                 ),
            .init(title: "",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .none("He stood up for me in front of everyone.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .respectMessage("I respect you for doing that.")
                        ]
                    )
                  ]
                 ),
            
        ]
    }
    
    var sweetTalkStoriesForFemale: [Story] {
        return [
            .init(title: "He held her tight during the loud thunderstorm.",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .female,
                        items: [
                            .heartFeeling("It felt so good to have you hold me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .bodyFeeling("My heart felt relaxed and safe.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .senseOfSight("I love seeing your beautiful eyes as you smile at me,"),
                            .senseOfSmell("your sweet smell,"),
                            .none("and the touch of your hand.")
                        ]
                    )
                  ]),
            .init(title: "He picked her up in his new car.",
                  authorGender: .female,
                  statements: [
                    .init(
                        genderSource: .female,
                        items: [
                            .heartFeeling("It feels so good to be here with you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .senseOfTouch("I love the feel of the leather seats in your new car.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .senseOfSight("The car is beautiful, just like you.")
                        ]
                    )
                  ])
        ]
    }
    

    
    
}

