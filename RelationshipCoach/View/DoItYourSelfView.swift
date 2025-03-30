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
                if viewModel.stories.isEmpty {
                    Text("To \"DO IT YOUR SELF\", click the + button on the top right corner.")
                        .font(.headline)
                        .foregroundStyle(Color.textColor.opacity(0.5))
                        .padding(.horizontal, 32)
                        .padding(.vertical, 64)
                        .multilineTextAlignment(.center)
                        
                }
                ForEach(viewModel.stories, id: \.id) { story in
                    HStack {
                        HStack {
                            Text("Created On:")
                                .foregroundStyle(Color.black)
                                .fontWeight(.bold)
                            Text(story.createdAt.formatted())
                                .foregroundStyle(Color.black)
                        }
                        
                        Spacer()
                        VStack {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.blue)
                                .padding(.vertical)
                                .onTapGesture {
                                    routeManager.routes.append(.updateDoItYourSelfStory(story))
                                }
                            Image(systemName: "trash")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.red)
                                .padding(.bottom)
                                .onTapGesture {
                                    Task {
                                        await viewModel.deleteStory(story: story, for: gender)
                                    }
                                }
                        }
                    }
                    .padding()
                    .background(Color.white) // Required for shadow visibility
                    .cornerRadius(10) // Optional for rounded edges
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5) // Drop shadow
                    .padding()
                }
            }
        }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        routeManager.routes.append(.addDoItYourSelfStory(story))
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Do it yourself add")
                        .foregroundColor(.white)
                        .bold()
                }
            }
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
