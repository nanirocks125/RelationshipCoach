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
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    ForEach(0 ..< tips.count, id: \.self) { index in
                        let tip = tips[index]
                        Text(tip)
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
                self.tips = story.coachingTipsForFemale
            case .female:
                self.tips = story.coachingTipsForMale
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
