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
                ForEach(0..<viewModel.items.count, id: \.self) { index in
                    Group {
                        Text(viewModel.items[index].fromGenderTitle)
                        TextField("", text: $viewModel.items[index].fromGenderSaid)
                            .padding(8)
                            .background(.white.opacity(0.2))
                            .autocorrectionDisabled(true)
                        Text(viewModel.items[index].userSaidTitle)
                        TextField("", text: $viewModel.items[index].userSaid)
                            .padding(8)
                            .background(.white.opacity(0.2))
                            .autocorrectionDisabled(true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
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
                    Text("Save")
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
