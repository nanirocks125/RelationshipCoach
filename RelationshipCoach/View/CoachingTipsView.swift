//
//  CoachingTipsView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct CoachingTipsView: View {
    
    @AppStorage("gender") var gender: Gender = .female

    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    Text(tip1)
                    Text(tip2)
                    Text(tip3)
                    Text(tip4)
                    Text(tip5)
                    Text(tip6)
                    Text(tip7)
                    Text(tip8)
                    Text(tip9)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Coaching Tips")
                    .foregroundColor(.white)
            }
        }
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

extension CoachingTipsView {
    
    var tip1: AttributedString {
        var finalString = AttributedString("")
        
        var text1 = AttributedString("Omit the words ")
        text1.foregroundColor = .black
        text1.font = .systemFont(ofSize: 14)
        finalString += text1
        
        var text2 = AttributedString("You, Because, Hurt")
        text2.foregroundColor = gender.color
        text2.font = .systemFont(ofSize: 14)
        finalString += text2
        
        var text3 = AttributedString(" and ")
        text3.foregroundColor = .black
        text3.font = .systemFont(ofSize: 14)
        finalString += text3
        
        var text4 = AttributedString("Disappointed")
        text4.foregroundColor = gender.color
        text4.font = .systemFont(ofSize: 14)
        finalString += text4
        
        var text5 = AttributedString(" when you're expressing your feelings about a situation, so he doesn't feel blamed or shamed.")
        text5.foregroundColor = .black
        text5.font = .systemFont(ofSize: 14)
        finalString += text5
        
        return finalString
    }
    
    var tip2: AttributedString {
        "Take 100% responsibility for yourself and focus only on your feelings."
    }
    
    var tip3: AttributedString {
        var finalString = AttributedString("")
        
        var text1 = AttributedString("To do this, figure out the result from the situation; ex: If he ignored you, figure out the result of being ignored. \"I felt alone when that happened\" ")
        text1.foregroundColor = .black
        text1.font = .systemFont(ofSize: 14)
        finalString += text1
        
        var text2 = AttributedString("(instead of \"you ignored me\")")
        text2.foregroundColor = gender.color
        text2.font = .systemFont(ofSize: 14)
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
}

#Preview {
    CoachingTipsView()
}
