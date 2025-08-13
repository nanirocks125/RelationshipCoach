//
//  ConversationStartersView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct ConversationStartersView: View {
    @ObservedObject var viewModel = ConversationStartesViewModel()
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
                ForEach(0..<viewModel.conversationStarters.count, id: \.self) { index in
                    let starter = viewModel.conversationStarters[index]
                    Text("\(index+1). \(starter.title)")
                        .font(.system(size: UIPreferences.title))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(8)
                    Divider()
                    ForEach(0..<starter.statements.count, id:\.self) { statementIndex in
                        let statement = starter.statements[statementIndex]
                        
                        Text(statement.attributedStringForItems(with: UIPreferences.text))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(8)
                            .padding(.trailing, 32)
                        Divider()
                    }
                }
            }
            .padding(8)
            .background(Color.rowBackgroundColor)
            .padding(16)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Conversation Starters")
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
                viewModel.prepareData(for: gender, story: story)
            }
        }
    }
}

#Preview {
    ConversationStartersView(story: .giving)
}
