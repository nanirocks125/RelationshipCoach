//
//  CoachingTipsView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct CoachingTipsView: View {
    
    @AppStorage("gender") var gender: Gender = .female
    @State var tips: [AttributedString] = []
    let story: StoryType
    init(story: StoryType) {
        self.story = story
    }
    
    var neverSayFollowing: some View {
        VStack(alignment: .leading) {
            Text("1. I'm sorry, BUT...")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
            
            Divider()
            
            Text("2. I'm sorry YOU FEEL THAT WAY.")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
            
            Divider()
            
            Text("3. \"I'm sorry if I hurt your your feelings.\"")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
            
            Divider()
            
            Text("4. \"I'm sorry that I may have hurt you\"")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
            
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.rowBackgroundColor)
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    if story == .myFault {
                        if gender == .male {
                            Text("Notice that he never blamed her, shamed her, felt entitled or was defensive when He apologized.")
                            
                            Text("He simply apologized.")
                            
                            Text("Never say the following when apologizing:")
                            
                            neverSayFollowing
                            
                            Text("The statements above invalidate the apology and actually make the situation worse.")
                            
                            Text("Sometimes we're afraid to be confronted, but if we use these 10 steps and ask for clarification, we're able to connect on a deeper level.")
                            
                            Text("By using these specific \"Love Chat\" messages, she will melt in your arms and will not be defensive because you are only expressing your feelings (taking 100% responsibility for your feeling).")
                            
                            Text("She will feel safe with you when you express yourself this way.")
                        } else {
                            Text("Notice that she never blamed, shamed, felt entitled or was defensive when she apologized.")
                            
                            Text("She simply apologized.")
                            
                            Text("Never say the following when apologizing:")
                            
                            neverSayFollowing
                            
                            Text("The statements above invalidate the apology and actually make the situation worse.")
                            
                            Text("Sometimes we're afraid to be confronted, but if we use these 10 steps and ask for clarification, we're able to connect on a deeper level.")
                        }
                        
                    } else {
                        ForEach(0 ..< tips.count, id: \.self) { index in
                            let tip = tips[index]
                            Text(tip)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Coaching Tips")
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .onAppear {
            switch gender {
            case .male:
                self.tips = story.coachingTipsForMale
            case .female:
                self.tips = story.coachingTipsForFemale
            case .none:
                self.tips = []
            }
        }
    }
}

extension CoachingTipsView {
    
    
}

#Preview {
    CoachingTipsView(story: .giving)
}
