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
    
    let story: StoryType
    var doItYourSelfStory: DoItYourSelfStory?
    init(story: StoryType,
         doItYourSelfStory: DoItYourSelfStory? = nil) {
        self.story = story
        self.doItYourSelfStory = doItYourSelfStory
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(viewModel.items.count+1) \(story.navigationTitle) \"Love Chat\" messages")
                    .font(.headline)
                    .padding(32)
                    .foregroundStyle(gender.color)
                VStack(spacing: 0) {
                    ForEach(0..<viewModel.items.count, id: \.self) { index in
                        Group {
                            Text(viewModel.items[index].fromGenderTitle)
                                .padding(.top, 24)
                            TextEditor(text: $viewModel.items[index].fromGenderSaid)
                                .frame(height: 80)
                                .scrollContentBackground(.hidden)
                                .autocorrectionDisabled(true)
                                .accentColor(gender.color)
                            Divider()
                            HStack {
                                Group {
                                    Text(viewModel.items[index].userSaidTitle)
                                    Text(viewModel.items[index].type.displayString)
                                        .foregroundStyle(gender.color)
                                        .fontWeight(.bold)
                                }
                            }.padding(.top, 24)
                            TextEditor(text: $viewModel.items[index].userSaid)
                                .frame(height: 80)
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
        }
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .onAppear {
            viewModel.prepareForm(story: story, doItYourSelfStory: doItYourSelfStory)
        }
    }
}

#Preview {
    AddDoItYourSelfStoryView(story: .hisFault)
}
