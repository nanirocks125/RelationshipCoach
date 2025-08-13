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
                VStack(alignment: .leading) {
                    ForEach(0..<viewModel.steps.count, id: \.self) { index in
                        let step = viewModel.steps[index].stepDescription
                        Text("\(index + 1). \(step)")
                            .foregroundStyle(gender.color)
                            .font(.system(size: UIPreferences.text))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)
                        if index < viewModel.steps.count - 1 {
                            Divider()
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
                .background(Color.rowBackgroundColor)
                .padding(.horizontal, 16)
                .padding(.top, 16)
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
        .toolbarBackground(Color.themeColor, for: .navigationBar)
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
