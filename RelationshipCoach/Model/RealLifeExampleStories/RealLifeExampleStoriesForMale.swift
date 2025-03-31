//
//  RealLifeExampleStoriesForMale.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 31/03/25.
//

import Foundation

extension StoryType {
    var examplesForMale: [Story] {
        switch self {
        case .hisFault:
            return []
        case .herFault:
            return herFaultStories //herFaultStories
        case .myFault:
            return myFaultStoriesForMale //myFaultStoriesForMale
        case .toxic:
            return toxicChatStoriesForMale //toxicChatStoriesForMale
        case .giving:
            return givingTalkStories //givingTalkStories
        case .receiving:
            return []
        case .sweet:
            return sweetTalkStoriesForMale //sweetTalkStoriesForMale
        }
    }
    
    var herFaultStories: [Story] {
        return [
            .init(title: "She made fun of his haircut in front of his friends.",
                  authorGender: .male,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [.heartFeeling("I felt funny"),
                                .fact("when the comment was made about my hair.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("Well, it wasn't that big of a deal.")
                               ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.bodyFeeling("That makes my stomach tighten up to hear that."),
                                .negativeSelfFeeling("I don't like feeling this way."),
                                .callToAction("How do you think we can make this better?")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("Well, I'm sorry. I won't say things like that anymore.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.clarification("Help me understand a little more what you mean by that.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("I am deciding right now to only say nice and respectful things about you in front of other people and in private too.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.appreciation("Thank you.")]
                    )
                  ]),
            .init(title: "She left you out of the conversation at the company party:",
                  authorGender: .male,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [.heartFeeling("I felt left out"),
                                .fact("at the party.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("Well, I was just talking business to my co-worker.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.heartFeeling("I felt embarrassed and my chest tightened up."),
                                .negativeSelfFeeling("I don't like that uncomfortable feeling."),
                                .callToAction("How do you think we can keep this form happening again?")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("You're right. I'm sorry you were left out. I am committing to include you next time.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.clarification("Help me understand what you mean by that.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("You have interesting things to say and I'm proud to be with you, so I'll make a point to enter you into the conversation.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.appreciation("Thank you.")]
                    )
                  ])
        ]
    }
    
    var myFaultStoriesForMale: [Story] {
        return [
            .init(title: "",
                  authorGender: .male,
                  statements: [
                    .init(
                        genderSource: .female,
                        items: [
                            .none("You didn't pay any attention to me at the party.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .admit("You're right. I didn't pay attention to you at the party"),
                            .apologize("and I'm very sorry."),
                            .firstAppreciation("Thank you for sharing that with me and not hiding your feelings."),
                            .commitToChange("I commit to not doing that again."),
                            .askForgiveness("Would you please forgive me?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Ok, I forgive you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .clarification("Is there anything else bothering you?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Well, yes. I also feel like you take your frustrations from work out on me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .soothingCycle("So you feel"),
                            .noBlameShameEntitlementOrDefensive("like you bear the brunt of my frustrations from work and would like for me to quit taking it out on you?"),
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Yes, you treat me like one of your employees. I have employees too, and I don't treat you like I treat them.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .soothingCycle("So you feel like I treat you like one of my employees and want me to treat you more special?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Yes, that would feel great!")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .clarification("Help me understand a little better.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Well, I feel like you take me for granted")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .feelFeltFindingOut("Ok. Now I know how you must feel, I have felt that way before and what I'm finding out is that it is more painful to you than I realized."),
                            .apologizeAgain("I'm sorry."),
                            .askForgivenessAgain("I would like to ask for your forgiveness and trust in me from here on out.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Oh honey, I love you and I forgive you. Thank you for listening and understanding my point of view.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
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
                        genderSource: .female,
                        items: [
                            .none("You leave the house in such a mess and I always have to pick up after you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .admit("You're right."),
                            .apologize("I have gotten sloppy and I apologize.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Well, I don't know how much longer I can put up with it.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .firstAppreciation("Thank you for telling me how much it bothers you."),
                            .commitToChange("I commit to picking up my mess."),
                            .askForgiveness("Would you please forgive me?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Yes, I forgive you.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .clarification("Is there anything else bothering you?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Yes, I cannot get everything done at work by the deadline that's been set and I'm really stressing about it.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .soothingCycle("So you feel under a lot of pressure at work to make your deadline and want me to help make it easier at home?")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Yes, I'm worried that I might lose my job over this.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .secondClarification("Tell me more.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Well, I'm afraid we'd have to move if I lost my job.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .feelFeltFindingOut("I know how you must feel, I've felt pressure at work before, but what I'm finding out"),
                            .secondAppreciation("is that you are a smart and dependable woman and I know you can do it. Thank you for working so hard. I appreciate you.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [
                            .none("Thank you honey.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .reconnect("You're welcome. Please sit on the couch with me so I can give you a big hug.")
                        ]
                    )
                  ])
        ]
    }
    
    var toxicChatStoriesForMale: [Story] {
        return [
            .init(title: "",
                  authorGender: .male,
                  statements: [
                    .init(
                        genderSource: .female,
                        items: [
                            .none("I'm irritated that I have to pick you up because your car broke down and you're never ready when I get here.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                                .admit("You're right. I haven't been ready on time."),
                                .apologize("I'm sorry."),
                                .appreciation("Thank you for coming to pick me up."),
                                .commitToChange("I commit to being ready next time."),
                                .askForgiveness("Please forgive me.")
                        ]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("Well, I don't know what you do in there, but it's not working. You look awful!")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.heartFeeling("That feels bad to hear.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("Well, you're just a slob and I can't stand you anymore.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.bodyFeeling("My stomach is in knots hearing that."),
                                .negativeSelfFeeling("I don't like feeling this way.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("Well, you're just a piece of trash!")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.givePermission("You can talk to me any way you want,"),
                                .takeYourFeelingsForAWalk("but hearing that makes me need to leave.")]
                    )
                  ]),
            .init(title: "",
                  authorGender: .male,
                  statements: [
                    .init(
                        genderSource: .female,
                        items: [.none("You didn't get the kids to school on time this morning.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.admit("You're right. I admit that I didn't get the kids to school on time this morning.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("You always mess things up.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.apologize("I'm sorry I didn't get the kids to school on time."),
                                .appreciation("I appreciate you wanting them to be on time.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("I don't know how you get anything done.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.commitToChange("I commit to getting the kids to school on time."),
                                .askForgiveness("Please forgive me.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("Well, you can't seem to do anything right anyway. I'm the only one around here who gets things done.")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [.heartFeeling("I feel bad to hear that.")]
                    ),
                    .init(
                        genderSource: .female,
                        items: [.none("You're just lazy and I can't stand you anymore!")]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .negativeSelfFeeling("My chest feels tight when I hear that. (body feeling) I don't like this feeling."),
                            .takeYourFeelingsForAWalk("I'm happy to talk when it's nice, but untill that changes, I need to leave."),
                        ]
                    )
                  ])
        ]
    }
    
    var givingTalkStories: [Story] {
        return [
            .init(title: "She lost her job.",
                  authorGender: .male,
                  statements: [
                    .init(
                        genderSource: .none,
                        items: [.none("He brings flowers to her house and helps her look online for a new job")
                        ]
                    )
                    ]
                 ),
            .init(title: "She loves old movies with Jennifer Lopez",
                  authorGender: .male,
                  statements: [
                    .init(
                        genderSource: .none,
                        items: [.none("He searches to find a special series of Jennifer Lopez movies and download them for her birthday.")
                        ]
                    )
                    ]
                 ),
            .init(title: "Her sink is stopping up",
                  authorGender: .male,
                  statements: [
                    .init(
                        genderSource: .none,
                        items: [.none("He comes over early for a date, brings his tools and repairs the sink before going on the date.")
                        ]
                    )
                    ]
                 ),
        ]
    }
    
    var sweetTalkStoriesForMale: [Story] {
        return [
            .init(title: "She took care of you when you were sick.",
                  authorGender: .male,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .heartFeeling("It felt so good to have you take care of me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .bodyFeeling("My heart felt light and happy.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .senseOfSmell("I loved the smell of your body as you stood close to me and took care of me."),
                        ]
                    )
                  ]),
            .init(title: "She picked up your dry cleaning and gave you a hug.",
                  authorGender: .male,
                  statements: [
                    .init(
                        genderSource: .male,
                        items: [
                            .heartFeeling("Thank you for picking up my dry cleaning. It makes me feel so loved"),
                            .none("when you do things like that for me.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .senseOfTouch("I love feeling your hug.")
                        ]
                    ),
                    .init(
                        genderSource: .male,
                        items: [
                            .senseOfSight("I also like seeing your beautiful blue eyes looking up at me.")
                        ]
                    )
                  ])
        ]
    }
}
