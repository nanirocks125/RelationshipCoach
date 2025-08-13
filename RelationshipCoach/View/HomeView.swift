//
//  ContentView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 25/03/25.
//

import SwiftUI
import AVKit

struct HomeView: View {
    
    @EnvironmentObject var routeManager: RouteManager
    @ObservedObject var viewModel: HomeViewModel = .init()
    @AppStorage("gender") var gender: Gender = .female

    var body: some View {
        NavigationStack(path: $routeManager.routes) {
            ScrollView {
                VStack(spacing: 0) {
                        if let videoPath = Bundle.main.url(forResource: "homevideo", withExtension: "mp4") {
                            FullFitVideoPlayer(url: videoPath, height: 240)
                                .frame(height: 240)
                                .clipped()
                        }
                    
                    ForEach(0..<viewModel.sections.count, id: \.self) { sectionIndex in
                        let section = viewModel.sections[sectionIndex]
                        VStack(spacing: 0) {
                            ForEach(0..<section.items.count, id: \.self) { itemIndex in
                                let item = section.items[itemIndex]
                                
                                RCCardView(height: 72) {
                                    RCIconView(name: item.icon, backgroundColor: gender.color)
                                    
                                    VStack {
                                        Text(item.title)
                                            .font(.system(size: UIPreferences.text))
                                            .foregroundStyle(Color.textColor)
                                            .bold()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .frame(height: 50)
                                    Spacer()
                                    Image(gender.arrowAsset)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .aspectRatio(contentMode: .fit)
                                }
                                .onTapGesture {
                                    let section = viewModel.sections[sectionIndex]
                                    if section.type == .story {
                                        if let story = item.story {
                                            routeManager.routes.append(.story(story))
                                        }
//                                        else if item.isSharing {
//                                            self.isSharing = true
//                                        }
                                    }
                                    
//                                    if section.type == .preference {
//                                        routeManager.routes.append(.preference)
//                                    }
//                                    
//                                    if section.type == .instagram {
//                                        openInstagramProfile(username: "relationshipcoachllc")
//                                    }
//                                    
//                                    if section.type == .web {
//                                        if let url = item.url {
//                                            openURL(url)
//                                        }
//                                    }
                                }
                            }
                        }
                    }
                }
            }

            .background(Color.backgroundColor)
            .onAppear {
                viewModel.prepareSections(for: gender)
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .story(let story):
                    StoryView(storyType: story)
//                case .preference:
//                    PreferencesView()
//                case .coach:
//                    AboutCoachView()
//                case .privacyPolicy:
//                    PrivacyPolicyView()
//                case .termsAndConditions:
//                    TermsAndConditionsView()
//                case .changeGender:
//                    ChangeGenderView()
                case .realLifeExamples(let story):
                    RealLifeExamplesView(story: story)
                case .steps(let story):
                    StepsView(story: story)
                case .conversationStarters(let story):
                    ConversationStartersView(story: story)
                case .coachingTips(let story):
                    CoachingTipsView(story: story)
                case .doItYourSelf(let story):
                    DoItYourSelfView(story: story)
                case .addDoItYourSelfStory(let story):
                    AddDoItYourSelfStoryView(story: story)
                case .updateDoItYourSelfStory(let story):
                    AddDoItYourSelfStoryView(story: story.story, doItYourSelfStory: story)
                }
            }
        }
        .accentColor(Color.white)
    }
}

#Preview {
    HomeView()
        .environmentObject(RouteManager())
}

func navigationTitleView(_ title: String) -> Text {
    Text(title)
        .font(.system(size: 20, weight: .bold, design: .default))
        .foregroundColor(Color.white)
}
