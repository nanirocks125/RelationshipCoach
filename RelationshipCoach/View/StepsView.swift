//
//  StepsView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct StepsView: View {
    @ObservedObject var viewModel = StepsViewModel()
    @AppStorage("gender") var gender: Gender = .female
    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var uiManager: UserSettingsPreferenceManager

    let story: StoryType
    init(story: StoryType) {
        self.story = story
    }
    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.header)
                    .font(.system(size: UIPreferences.text))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.trailing, 8)
                ForEach(0..<viewModel.steps.count, id: \.self) { index in
                    let step = viewModel.steps[index].stepDescription
                    RCCardView(height: 72) {
                        Text("\(index + 1). \(step)")
                            .foregroundStyle(gender.color)
                            .font(.system(size: UIPreferences.text))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)
                            .padding(.leading, 8)
                    }
                }
                Spacer()
            }
        }
        .padding(.top, 24)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Steps")
                    .foregroundColor(.white)
                    .bold()
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Go back
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("\(story.navigationTitle)") // Custom text
                    }
                }
            }
        }
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.prepareData(for: story, gender: gender)
        }
    }
}

#Preview {
    StepsView(story: .herFault)
}
