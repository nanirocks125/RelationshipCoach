//
//  CoachingaboutsView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct AboutCoachView: View {
    
    @AppStorage("gender") var gender: Gender = .female

    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    Text(about1)
                    Text(about2)
                    Text(about3)
                    Text(about4)
                    Text(about5)
                    Text(about6)
                    Text(about7)
                    Text(about8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("About Coach Camille")
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

extension AboutCoachView {
    
    var about1: AttributedString {
        var finalString = AttributedString("")
        
        var text1 = AttributedString("Camille offers a certification for others to ")
        text1.foregroundColor = Color.textColor
        text1.font = .systemFont(ofSize: 17)
        finalString += text1
        
        var text2 = AttributedString("Become A Coach")
        text2.foregroundColor = gender.color
        text2.font = .systemFont(ofSize: 17, weight: .bold)
        finalString += text2
        
        var text3 = AttributedString(" where you’ll learn new tools for your personal life and teach those tools to others through online and/or in-person workshops. Facilitating the plug-n-play workshops is easy and fun. The workshops have been called “Priceless” and “Relationship Changing!”")
        text3.foregroundColor = Color.textColor
        text3.font = .systemFont(ofSize: 17)
        finalString += text3
        
        return finalString
    }
    
    var about2: AttributedString {
        "Camille understands there are a lot of people who enjoy facilitating groups and would like to be a bright light in this world and make a difference, but just haven’t found the right avenue yet. She invites you to invest in yourself by purchasing the Become A Coach product and helping others. Isn’t it time for you to let your light shine?"
    }
    
    var about3: AttributedString {
        "If facilitating isn’t for you, she offers other powerful products:"
    }
    
    var about4: AttributedString {
        var finalString = AttributedString("")
        
        var text2 = AttributedString("“Miracle Moments”")
        text2.foregroundColor = gender.color
        text2.font = .systemFont(ofSize: 17, weight: .bold)
        finalString += text2
        
        var text1 = AttributedString("video series for Single Women. Are you ready to get off the dating cycle and into a real marriage or relationship? This series has 105 short daily videos to watch to get the unfair advantage and create the love you want.")
        text1.foregroundColor = Color.textColor
        text1.font = .systemFont(ofSize: 17)
        finalString += text1

        return finalString
    }
    
    var about5: AttributedString {
        var finalString = AttributedString("")
        
        var text2 = AttributedString("“Relationship Miracles”")
        text2.foregroundColor = gender.color
        text2.font = .systemFont(ofSize: 17, weight: .bold)
        finalString += text2
        
        var text1 = AttributedString("audio series for all people in a relationship or wanting to be in a relationship. These audios finally get you out of a negative communication cycle so you can finally build a deep emotional connection. This series has 5 full length audios to coordinate with the 5 sections of the mobile app.")
        text1.foregroundColor = Color.textColor
        text1.font = .systemFont(ofSize: 17)
        finalString += text1

        return finalString
    }
    
    var about6: AttributedString {
        var finalString = AttributedString("")
        
        var text1 = AttributedString("Camille is a professionally trained and certified “Relationship Coach for Couples and Dating Coach for Singles” and founder of ")
        text1.foregroundColor = Color.textColor
        text1.font = .systemFont(ofSize: 17)
        finalString += text1
        
        var text2 = AttributedString("RelationshipCoachLLC.com")
        let linkRange = text2.range(of: "RelationshipCoachLLC.com")!
        text2[linkRange].link = URL(string: "https://relationshipcoachcamille.com/")
        text2.underlineColor = UIColor(gender.color)
        text2.underlineStyle = .single
        text2.foregroundColor = gender.color
        text2.font = .systemFont(ofSize: 17, weight: .bold)
        finalString += text2

        return finalString
    }
    
    var about7: AttributedString {
        var finalString = AttributedString("")
        
        var text1 = AttributedString("After experiencing an unexpected divorce, she searched for answers to help her heal from her broken marriage and create the great love she has with her new husband. She knows that everyone can have a great relationship, but sometimes it takes new tools and tweaking things a bit. This is the reason she is passionate about getting the word out through her network of coaches who are facilitating ")
        text1.foregroundColor = Color.textColor
        text1.font = .systemFont(ofSize: 17)
        finalString += text1
        
        var text2 = AttributedString("“Relationship Workshops.”")
        text2.foregroundColor = gender.color
        text2.font = .systemFont(ofSize: 17, weight: .bold)
        finalString += text2

        return finalString
    }
    
    var about8: AttributedString {
        var finalString = AttributedString("")
        
        var text1 = AttributedString("If you have a heart for helping others and would like to learn and teach new relationship tools, I invite you to ")
        text1.foregroundColor = Color.textColor
        text1.font = .systemFont(ofSize: 17)
        finalString += text1
        
        var text2 = AttributedString("“Become A Coach”")
        text2.foregroundColor = gender.color
        text2.font = .systemFont(ofSize: 17, weight: .bold)
        finalString += text2
        
        var text3 = AttributedString(" at ")
        text3.foregroundColor = Color.textColor
        text3.font = .systemFont(ofSize: 17)
        finalString += text3
        
        var text4 = AttributedString("www.relationshipcoachllc.com")
        
        let linkRange = text4.range(of: "www.relationshipcoachllc.com")!
        text4[linkRange].link = URL(string: "https://relationshipcoachcamille.com/")
        text4.underlineColor = UIColor(gender.color)
        text4.underlineStyle = .single
        text4.foregroundColor = gender.color
        text4.font = .systemFont(ofSize: 17, weight: .bold)
        finalString += text4
        
        var text5 = AttributedString(" today. Are you ready? If not, I invite you to invest in yourself through the powerful Miracle Moments video series or Relationship Miracles audio series. I’m here to help you create the relationship you’ve always dreamed of having. It’s easier than you think!")
        text5.foregroundColor = Color.textColor
        text5.font = .systemFont(ofSize: 17)
        finalString += text5

        return finalString
    }
    
}

#Preview {
    AboutCoachView()
}

/// Camille is a professionally trained and certified “Relationship Coach” through the Hendricks Institute, Ojai, California.
///
/// After experiencing an unexpected divorce from a long marriage, she searched for answers to help her heal and to create the great love she has with her new husband today.
///
/// Her vision is for each one of YOU to have a great relationship, whether it’s a partner, family member, friend, coworker, neighbor, etc. Sometimes, it isn’t easy, but with these tools, you really can create and sustain great relationships that last a lifetime.
///
/// Even though this is focused on partner relationships, the tools apply to all relationships. She’s used it in many situations, and you can too.
///
/// You’re invited to study it, practice the Do-It-Yourself with her guiding prompts and see the magic happen, one relationship at a time!
