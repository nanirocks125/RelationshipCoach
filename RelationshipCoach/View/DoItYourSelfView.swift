//
//  DoItYourSelfView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct DoItYourSelfView: View {
    @ObservedObject var viewModel = DoItYourSelfViewModel()
    @EnvironmentObject var routeManager: RouteManager
    @AppStorage("gender") var gender: Gender = .female
    let story: StoryType
    init(story: StoryType) {
        self.story = story
    }
    var body: some View {
        ScrollView {
            VStack {
                Text("Stories \(viewModel.stories.count)")
                ForEach(viewModel.stories, id: \.id) { story in
                    HStack {
                        Text(story.createdAt.formatted())
                            .foregroundStyle(Color.textColor)
                        Spacer()
                        VStack {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.blue)
                                .onTapGesture {
                                    routeManager.routes.append(.updateDoItYourSelfStory(story))
                                }
                            Image(systemName: "trash")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.red)
                                .onTapGesture {
                                    Task {
                                        await viewModel.deleteStory(story: story, for: gender)
                                    }
                                }
                        }
                    }
                    .padding()
                    .cornerRadius(20)
                    .border(.gray)
                    .padding()
                    
                }
            }
        }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        routeManager.routes.append(.addDoItYourSelfStory(story))
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("Do it yourself add")
            .toolbarBackground(gender.color, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear {
                print("Preparing stories")
                Task {
                    await viewModel.prepareStories(story: story, for: gender)
                }
                
            }
    }
}

#Preview {
    DoItYourSelfView(story: .hisFault)
}
