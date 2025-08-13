//
//  ConversationTipsForFemale.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 31/03/25.
//

import Foundation
import SwiftUI

extension StoryType {
    func coachingTipsForFemale(size: CGFloat) -> [AttributedString] {
        switch self {
        case .hisFault:
            return hisFaultCoachingTips(size: size)
        case .herFault:
            return []
        case .myFault:
            return myFaultCoachingTipsForFemale(size: size)
        case .toxic:
            return toxicChatCoachingTipsForFemale(size: size)
        case .giving:
            return []
        case .receiving:
            return receivingTalkCoachingTips(size: size)
        case .sweet:
            return sweetTalkCoachingTipsForFemale(size: size)
        }
    }
    
    func hisFaultCoachingTips(size: CGFloat) -> [AttributedString] {
        var tip1: AttributedString {
            var finalString = AttributedString("")
            
            var text1 = AttributedString("Omit the words ")
            text1.foregroundColor = Color.textColor
            text1.font = .systemFont(ofSize: size)
            finalString += text1
            
            var text2 = AttributedString("You, Because, Hurt")
            text2.foregroundColor = Gender.female.color
            text2.font = .systemFont(ofSize: size, weight: .bold)
            finalString += text2
            
            var text3 = AttributedString(" and ")
            text3.foregroundColor = Color.textColor
            text3.font = .systemFont(ofSize: size)
            finalString += text3
            
            var text4 = AttributedString("Disappointed")
            text4.foregroundColor = Gender.female.color
            text4.font = .systemFont(ofSize: size, weight: .bold)
            finalString += text4
            
            var text5 = AttributedString(" when you're expressing your feelings about a situation, so he doesn't feel blamed or shamed.")
            text5.foregroundColor = Color.textColor
            text5.font = .systemFont(ofSize: size)
            finalString += text5
            
            return finalString
        }
        
        var tip2: AttributedString {
            "Take 100% responsibility for yourself and focus only on your feelings."
        }
        
        var tip3: AttributedString {
            var finalString = AttributedString("")
            
            var text1 = AttributedString("To do this, figure out the result from the situation; ex: If he ignored you, figure out the result of being ignored. \"I felt alone when that happened\" ")
            text1.foregroundColor = Color.textColor
            text1.font = .systemFont(ofSize: size)
            finalString += text1
            
            var text2 = AttributedString("(instead of \"you ignored me\")")
            text2.foregroundColor = Gender.female.color
            text2.font = .systemFont(ofSize: size, weight: .bold)
            finalString += text2
            return finalString
        }
        
        var tip4: AttributedString {
            "By following these steps, he won't get the idea that you feel entitled or are defensive. He will feel that you are soft and sensitive and have feelings about the situation because you care."
        }
        
        var tip5: AttributedString {
            "By using these specific \"Love Chat\" messages, he will melt in your arms and will not be defensive because you are only expressing your feelings (taking 100% responsibility for your feelings). He will feel safe with you when you express yourself this way. If he's a man worth keeping, he'll step up to the plate and be respectful."
        }
        
        var tip6: AttributedString {
            "He will appreciate you for not blaming him, only speaking about your feelings and being brave enough to be honest and open enough to ask what you think the two of you can do to resolve the issue."
        }
        
        var tip7: AttributedString {
            "It's always 100% about you and your feelings. You're the only person who can control you! Have that 20 second conversation with him that you dread having...I promise you, it will be worth it."
        }
        
        var tip8: AttributedString {
            "Also, notice that any time you have a conversation like this with a man, it brings you closer and he will see you as more \"confident\" than other women."
        }
        
        var tip9: AttributedString {
            "He will see the softer, feminine side and he'll want to be with you."
        }
        
        return [tip1, tip2, tip3, tip4, tip5, tip6, tip7, tip8, tip9]
    }
    
    func myFaultCoachingTipsForFemale(size: CGFloat) -> [AttributedString] {
        var tip1: AttributedString {
            "Notice that she never blamed, shamed, felt entitled or was defensive when she apologized."
        }
        
        var tip2: AttributedString {
            "She simply apologized."
        }
        
        var tip3: AttributedString {
            "The statements above invalidate the apology and actually make the situation worse."
        }
        
        var tip4: AttributedString {
            "Sometimes we're afraid to be confronted, but if we use these 10 steps and ask for clarification, we're able to connect on a deeper level."
        }
        return [tip1, tip2, tip3, tip4]
    }
    
    func toxicChatCoachingTipsForFemale(size: CGFloat) -> [AttributedString] {
        var tip1: AttributedString {
            "The goal is to only focus on your feelings (self-centered in a good way). You never told him how he should or should not feel, only how YOU felt."
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
            "If he's a man worth keeping, he'll step up to the plate and be respectful and appreciate you for not blaming him, only speaking about your feelings."
        }
        var tip9: AttributedString {
            "It's always 100% about you and your feelings. You're the only person who can control you!"
        }
        
        var tip10: AttributedString {
            "Have that 20 second conversation that you dread having...I promise you, it will be worth it."
        }
        return [tip1, tip2, tip3, tip4, tip5, tip6, tip7, tip8, tip9, tip10]
    }
    
    func receivingTalkCoachingTips(size: CGFloat) -> [AttributedString] {
        var tip1: AttributedString {
            "Men need to give and have their gift received. They also need appreciation, admiration, respect and love, but most of all, respect."
        }
        
        var tip2: AttributedString {
            "When you're receiving from a man, let him know that you respect him."
        }
        
        var tip3: AttributedString {
            "Sometimes, allow him to give to you without giving back to him. I know this is hard, but he wants to give to you."
        }
        
        var tip4: AttributedString {
            "For example: when it's your birthday and he gives you a gift, you don't have to give him one back. It's your birthday, not his, so just remember, every day is your birthday."
        }
        var tip5: AttributedString {
            "You were born to be loved and adored. receive his touch. Be like a pet who needs love and attention, show appreciation by your smile and glow, not by \"doing for him\", but \"just by being.\""
        }
        
        var tip6: AttributedString {
            "You'll \"be\" the object of his affection. Say \"thank you\" even if it's uncomfortable. Say \"thank you\" sometimes without reciprocating the compliment."
        }
        
        var tip7: AttributedString {
            "Obviously, you will want to compliment him too, at times. Pause, say thank you, smile, hug, purr, wiggle, wink, play with your hair...be juicy!"
        }
        
        var tip8: AttributedString {
            "Notice that you may feel uncomfortable receiving a compliment or action from a man without giving him one in return."
        }
        var tip9: AttributedString {
            "Practice it with everyone you meet. It is actually a sign of self-respect when you can simply receive without the \"false sense of urgency\" to give back or make excuses about why you weren't worthy of the compliment."
        }
        
        return [tip1, tip2, tip3, tip4, tip5, tip6, tip7, tip8, tip9]
    }
    
    func sweetTalkCoachingTipsForFemale(size: CGFloat) -> [AttributedString] {
        
        
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
            "Men need to give and have their gift received. They also need appreciation, admiration, respect and love, but most of all, respect."
        }
        return [tip1, tip2, tip3, tip4]
    }
        
}
