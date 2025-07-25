//
//  AddStoryView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct AddDoItYourSelfStoryView: View {
    @ObservedObject var viewModel = AddDoItYourSelfStoryViewModel()
    @EnvironmentObject var routeManager: RouteManager
    @AppStorage("gender") var gender: Gender = .female
    @EnvironmentObject var uiManager: UserSettingsPreferenceManager
    @Environment(\.presentationMode) var presentationMode

    let story: StoryType
    var doItYourSelfStory: DoItYourSelfStory?
    init(story: StoryType,
         doItYourSelfStory: DoItYourSelfStory? = nil) {
        self.story = story
        self.doItYourSelfStory = doItYourSelfStory
    }
    
    func getAttributedString(title: String, displayString: String, size: Int) -> AttributedString {
        var title = AttributedString(title)
        title.font = .system(size: CGFloat(size))
        title.foregroundColor = Color.textColor
        var displayString = AttributedString(" \(displayString)")
        displayString.font = .system(size: CGFloat(size), weight: .bold)
        displayString.foregroundColor = gender.color
        return title + displayString
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(viewModel.items.count) \(story.navigationTitle) \"Love Chat\" messages")
                    .font(.system(size: uiManager.settings.text.cgFloat))
                    .padding(32)
                    .foregroundStyle(gender.color)
                VStack(spacing: 0) {
                    ForEach(0..<viewModel.items.count, id: \.self) { index in
                        let item = viewModel.items[index]
                        Group {
                            let title = getAttributedString(
                                title: item.fromGenderTitle,
                                displayString: item.fromGenderItemType.displayString,
                                size: uiManager.settings.text
                            )
                            
                            Text(title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 24)
                            TextEditor(text: $viewModel.items[index].fromGenderSaid)
                                .font(.system(size: uiManager.settings.text.cgFloat))
                                .frame(height: 80)
                                .scrollContentBackground(.hidden)
                                .autocorrectionDisabled(true)
                                .accentColor(gender.color)
                            Divider()
                            let usertitle = getAttributedString(
                                title: item.userSaidTitle,
                                displayString: item.userGenderItemType.displayString,
                                size: uiManager.settings.text
                            )
                            
                            Text(usertitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 24)
                            TextEditor(text: $viewModel.items[index].userSaid)
                                .frame(height: 80)
                                .font(.system(size: uiManager.settings.text.cgFloat))
                                .scrollContentBackground(.hidden)
                                .autocorrectionDisabled(true)
                                .accentColor(gender.color)
                            Divider()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .background(Color.rowBackgroundColor)
                .padding()

                Button {
                    Task {
                        if let doItYourSelfStory = doItYourSelfStory {
                            await viewModel.updateData(for: doItYourSelfStory, gender: gender)
                        } else {
                            await viewModel.saveData(gender: gender)
                        }
                        
                        routeManager.pop()
                    }
                } label: {
                    Text("SAVE")
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(gender.color)
                        .foregroundStyle(.white)
                        .padding()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Do it yourself")
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
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .onAppear {
            viewModel.prepareForm(story: story, doItYourSelfStory: doItYourSelfStory, gender: gender)
        }
    }
}

#Preview {
    AddDoItYourSelfStoryView(story: .hisFault)
}
