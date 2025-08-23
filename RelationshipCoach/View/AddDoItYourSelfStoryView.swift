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
//    @EnvironmentObject var uiManager: UserSettingsPreferenceManager
    @Environment(\.presentationMode) var presentationMode

    let story: StoryType
    var doItYourSelfStory: DoItYourSelfStory?
    init(story: StoryType,
         doItYourSelfStory: DoItYourSelfStory? = nil) {
        self.story = story
        self.doItYourSelfStory = doItYourSelfStory
    }
    
    func getAttributedString(title: String, displayString: String, size: CGFloat) -> AttributedString {
        var title = AttributedString(title)
        title.font = .system(size: size)
        title.foregroundColor = Color.textColor
        var displayString = AttributedString(" \(displayString)")
        displayString.font = .system(size: size, weight: .bold)
        displayString.foregroundColor = gender.color
        return title + displayString
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(viewModel.items.count) \(story.navigationTitle) \"Love Chat\" messages")
                    .font(.system(size: UIPreferences.text))
                    .padding(32)
                    .foregroundStyle(gender.color)
                VStack(spacing: 0) {
                    ForEach(0..<viewModel.items.count, id: \.self) { index in
                        let item = viewModel.items[index]
                        Group {
                            let title = getAttributedString(
                                title: item.fromGenderTitle,
                                displayString: item.fromGenderItemType.displayString,
                                size: UIPreferences.text
                            )
                            
                            Text(title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 24)
                            TextEditor(text: $viewModel.items[index].fromGenderSaid)
                                .font(.system(size: UIPreferences.text))
                                .frame(height: 80)
                                .scrollContentBackground(.hidden)
                                .autocorrectionDisabled(true)
//                                .accentColor(gender.color)
//                                .accentColor(.red)
                            Divider()
                            let usertitle = getAttributedString(
                                title: item.userSaidTitle,
                                displayString: item.userGenderItemType.displayString,
                                size: UIPreferences.text
                            )
                            
                            Text(usertitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 24)
                            TextEditor(text: $viewModel.items[index].userSaid)
                                .frame(height: 80)
                                .font(.system(size: UIPreferences.text))
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
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(gender.color)
                    .overlay {
                        Text("Save")
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 64)
                    .padding()
                    .onTapGesture {
                        Task {
                            await save()
                        }
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
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    Task {
                        await save()
                    }
                }) {
                    HStack {
                        Text("Save") // Custom text
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
    
    func save() async {
        if let doItYourSelfStory = doItYourSelfStory {
            await viewModel.updateData(for: doItYourSelfStory, gender: gender)
        } else {
            await viewModel.saveData(gender: gender)
        }
        
        routeManager.pop()
    }
}

#Preview {
    AddDoItYourSelfStoryView(story: .hisFault)
}
