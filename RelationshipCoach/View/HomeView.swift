//
//  ContentView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 25/03/25.
//

import SwiftUI
import AVKit

struct HomeView: View {
    
    @Environment(\.openURL) var openURL
    @EnvironmentObject var routeManager: RouteManager
    @ObservedObject var viewModel: HomeViewModel = .init()
    @AppStorage("gender") var gender: Gender = .female
    
    var body: some View {
        NavigationStack(path: $routeManager.routes) {
            ScrollView {
                VStack(spacing: 0) {
                        if let videoPath = Bundle.main.url(forResource: "homevideo", withExtension: "mp4") {
                            FullFitVideoPlayer(url: videoPath, height: 300)
                                .frame(height: 300)
                                .clipped()
                        }
                    
                    ForEach(0..<viewModel.sections.count, id: \.self) { sectionIndex in
                        let section = viewModel.sections[sectionIndex]
                        ForEach(0..<section.items.count, id: \.self) { itemIndex in
                            let item = section.items[itemIndex]
                            HStack {
                                Image(item.icon)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .aspectRatio(contentMode: .fit)
                                Text(item.title)
                                    .font(.callout)
                                    .foregroundStyle(section.type.textColor(for: gender))
                                    .bold()
                                Spacer()
                                Image(systemName: "arrow.right")
                            }
                            .padding(.vertical, 18)
                            .padding(.horizontal, 8)
                            .onTapGesture {
                                let section = viewModel.sections[sectionIndex]
                                if section.type == .story {
                                    if let story = item.story {
                                        routeManager.routes.append(.story(story))
                                    }
                                }
                                
                                if section.type == .preference {
                                    routeManager.routes.append(.preference)
                                }
                                
                                if section.type == .instagram {
                                    openInstagramProfile(username: "relationshipcoachllc")
                                }
                                
                                if section.type == .web {
                                    if let url = item.url {
                                        openURL(url)
                                    }
                                }
                            }
                        }
                        
                        Divider()
                            .padding(.bottom, 3)
                        Divider()
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
                case .preference:
                    PreferencesView()
                case .coach:
                    Text("Coach")
                case .privacyPolicy:
                    PrivacyPolicyView()
                case .termsAndConditions:
                    TermsAndConditionsView()
                case .changeGender:
                    ChangeGenderView()
                case .realLifeExamples:
                    RealLifeExamplesView()
                case .steps:
                    StepsView()
                case .conversationStarters:
                    ConversationStartersView()
                case .coachingTips:
                    CoachingTipsView()
                case .doItYourSelf:
                    DoItYourSelfView()
                }
            }
        }
        
    }
    
    func openInstagramProfile(username: String) {
        let appURL = URL(string: "instagram://user?username=\(username)")!
        let webURL = URL(string: "https://www.instagram.com/\(username)/")!
        
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    HomeView()
}

extension HomeSectionType {
    func textColor(for gender: Gender) -> Color {
        switch self {
        case .story, .instagram, .preference:
            return gender.color
        case .web:
            return Color.textColor
        }
    }
}
