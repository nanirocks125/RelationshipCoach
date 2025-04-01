//
//  RealLifeExampleStoriesForMale.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 31/03/25.
//

import Foundation
import SwiftUI

extension StoryType {
    var coachingTipsForMale: [AttributedString] {
        switch self {
        case .hisFault:
            return []
        case .herFault:
            return herFaultCoachingTips //herFaultStories
        case .myFault:
            return myFaultCoachingTipsForMale //myFaultStoriesForMale
        case .toxic:
            return toxicChatCoachingTipsForMale //toxicChatStoriesForMale
        case .giving:
            return givingTalkCoachingTips //givingTalkStories
        case .receiving:
            return []
        case .sweet:
            return sweetTalkCoachingTipsForMale //sweetTalkStoriesForMale
        }
    }
    
    var herFaultCoachingTips: [AttributedString] {
        var tip1: AttributedString {
            var finalString = AttributedString("")
            
            var text1 = AttributedString("Omit the words ")
            text1.foregroundColor = Color.textColor
            text1.font = .systemFont(ofSize: 17)
            finalString += text1
            
            var text2 = AttributedString("You, Because, Hurt")
            text2.foregroundColor = Gender.male.color
            text2.font = .systemFont(ofSize: 17, weight: .bold)
            finalString += text2
            
            var text3 = AttributedString(" and ")
            text3.foregroundColor = Color.textColor
            text3.font = .systemFont(ofSize: 17)
            finalString += text3
            
            var text4 = AttributedString("Disappointed")
            text4.foregroundColor = Gender.male.color
            text4.font = .systemFont(ofSize: 17, weight: .bold)
            finalString += text4
            
            var text5 = AttributedString(" when you're expressing your feelings about a situation, so she doesn't feel blamed or shamed.")
            text5.foregroundColor = Color.textColor
            text5.font = .systemFont(ofSize: 17)
            finalString += text5
            
            return finalString
        }
        
        var tip2: AttributedString {
            "Take 100% responsibility for yourself and focus only on your feelings."
        }
        
        var tip3: AttributedString {
            var finalString = AttributedString("")
            
            var text1 = AttributedString("To do this, figure out the result from the situation; ex: If She ignored you, figure out the result of being ignored. \"I felt alone when that happened\" ")
            text1.foregroundColor = Color.textColor
            text1.font = .systemFont(ofSize: 17)
            finalString += text1
            
            var text2 = AttributedString("(instead of \"you ignored me\")")
            text2.foregroundColor = Gender.male.color
            text2.font = .systemFont(ofSize: 17, weight: .bold)
            finalString += text2
            return finalString
        }
        
        var tip4: AttributedString {
            "By following these steps, She won't get the idea that you feel entitled or are defensive. She will feel that you are soft and sensitive and have feelings about the situation because you care."
        }
        
        var tip5: AttributedString {
            "By using these specific \"Love Chat\" messages, She will melt in your arms and will not be defensive because you are only expressing your feelings (taking 100% responsibility for your feelings). She will feel safe with you when you express yourself this way"
        }
        
        return [tip1, tip2, tip3, tip4, tip5]
    }
    
    var myFaultCoachingTipsForMale: [AttributedString] {
        var tip1: AttributedString {
            "Notice that he never blamed her, shamed her, felt entitled or was defensive when He apologized."
        }
        
        var tip2: AttributedString {
            "He simply apologized."
        }
        
        var tip3: AttributedString {
            "The statements above invalidate the apology and actually make the situation worse."
        }
        
        var tip4: AttributedString {
            "Sometimes we're afraid to be confronted, but if we use these 10 steps and ask for clarification, we're able to connect on a deeper level."
        }
        return [tip1, tip2, tip3, tip4]
    }
    
    var toxicChatCoachingTipsForMale: [AttributedString] {
        var tip1: AttributedString {
            "The goal is to only focus on your feelings (self-centered in a good way). You never told her how she should or should not feel, only how YOU felt."
        }
        
        var tip2: AttributedString {
            "It's simple, but not always easy to hold onto your feelings without wanting to blame the other person for their actions."
        }
        
        var tip3: AttributedString {
            "Sometimes we can do it great in the workplace, but in our family and romantic relationships, we tend to get lazy."
        }
        
        var tip4: AttributedString {
            "It's important to take a deep breath before entering into a conversation like this."
        }
        var tip5: AttributedString {
            "When you find yourself in a toxic conversation with a man, notice that you should not use the same steps that you use in other situations."
        }
        
        var tip6: AttributedString {
            "The reason is that toxic relationships simply don't work and it is a chance for you to see the relationship the way it truly is."
        }
        
        var tip7: AttributedString {
            "Once you recognize a toxic man, you can get help or leave the relationship and know that it is in your best interest rather than try to justify it and repeat the toxic cycle over and over again."
        }
        
        var tip8: AttributedString {
            "If she's a man worth keeping, she'll step up to the plate and be respectful and appreciate you for not blaming her, only speaking about your feelings."
        }
        var tip9: AttributedString {
            "It's always 100% about you and your feelings. You're the only person who can control you!"
        }
        
        var tip10: AttributedString {
            "Have that 20 second conversation that you dread having...I promise you, it will be worth it."
        }
        return [tip1, tip2, tip3, tip4, tip5, tip6, tip7, tip8, tip9, tip10]
    }
    
    var givingTalkCoachingTips: [AttributedString] {
        var tip1: AttributedString {
            "Since men are the ones who protect and serve their families, it is only natural that men include the above steps when \"courting\" a woman (whether they're courting their girlfriend or wife)."
        }
        
        var tip2: AttributedString {
            "In today's world, some of these courtesies are forgotten. So men, please remember that these are still important to a woman."
        }
        
        var tip3: AttributedString {
            "As a man, step up to the plate by anticipating her needs and asking her if you're giving enough to her. Ask her about her likes and dislikes so you can please her better."
        }
        
        var tip4: AttributedString {
            "Some women have trouble expressing their preferences, and actually, some women haven't had their needs met for so long that they don't even know what their preferences are!"
        }
        var tip5: AttributedString {
            "You'll also find that some women don't believe they're worth the gift of a compliment, nice deed or physical gift."
        }
        
        var tip6: AttributedString {
            "So, use and remember these steps every time you meet a woman. Practice wherever you go so that it becomes natural and you do it for your special woman without even thinking about it."
        }
        
        return [tip1, tip2, tip3, tip4, tip5, tip6]
    }
    
    var sweetTalkCoachingTipsForMale: [AttributedString] {
        
        
        var tip1: AttributedString {
            let text1 = "Notice that the words".femaleAttributedString
            
            let text2 = "\"because, that\",".femaleAttributedString
            
            let text3 = " or ".attributedString
            
            let text4 = "\"think\"".femaleAttributedString
            
            let text5 = "were not used.".attributedString
            
            return text1 + text2 + text3 + text4 + text5
        }
        
        var tip2: AttributedString {
            let text1 = "Those words are".attributedString
            
            let text2 = "\"thinking\"".femaleAttributedString
            
            let text3 = "words.".attributedString
            return text1 + text2 + text3
        }
        
        var tip3: AttributedString {
            let text1 = "In this situation, you only want to convey".attributedString
            
            let text2 = "\"feelings\"".femaleAttributedString
            
            let text3 = "and".attributedString
            
            let text4 = "\"senses\"".femaleAttributedString
            
            return text1 + text2 + text3 + text4
        }
        
        var tip4: AttributedString {
            "They don't need to be in any specific order."
        }
        return [tip1, tip2, tip3, tip4]
    }
}
