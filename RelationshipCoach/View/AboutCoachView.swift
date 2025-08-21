//
//  CoachingaboutsView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct AboutCoachView: View {
    
    @AppStorage("gender") var gender: Gender = .female
    var aboutInfo: [String] = [
        "**Camille** is a professionally trained and certified **“Relationship Coach”** through the Hendricks Institute, Ojai, California.",
        "After experiencing an unexpected divorce from a long marriage, she searched for answers to help her heal and to create the great love she has with her new husband today.",
        "**Her vision is for each one of YOU to have a great relationship,** whether it’s a partner, family member, friend, coworker, neighbor, etc. Sometimes, it isn’t easy, but with these tools, you really can create and sustain great relationships that last a lifetime.",
        "Even though this is focused on partner relationships, the tools apply to all relationships. She’s used it in many situations, and you can too.",
        "You’re invited to study it, practice the **Do-It-Yourself** with her guiding prompts and see the magic happen, one relationship at a time!"
        
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    ForEach(0..<aboutInfo.count, id:\.self) { index in
                        let info = aboutInfo[index]
                        Text(gender.createAttributedString(for: info))
                    }
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


public extension Gender {
    func createAttributedString(for text: String) -> AttributedString {
        do {
                // 1. Initialize from Markdown as before.
                var attributedString = try AttributedString(markdown: text)
                
                // 2. Apply the base styles to the entire string.
                attributedString.font = .systemFont(ofSize: 17)
                attributedString.foregroundColor = Color.textColor
                
                // 3. Loop through all styled sections ("runs") of the string.
                for run in attributedString.runs {
                    // Check if this run was parsed as "strong" (bold) from the Markdown.
                    if run.inlinePresentationIntent == .stronglyEmphasized {
                        // If it's bold, apply your custom foreground color to just that part.
                        attributedString[run.range].foregroundColor = color
                        attributedString[run.range].font = .systemFont(ofSize: 17, weight: .bold)
                    }
                }
                
                return attributedString
            } catch {
                print("Error parsing Markdown: \(error)")
                // Fallback to a plain string.
                return AttributedString(text.replacingOccurrences(of: "**", with: ""))
            }
    }
}

