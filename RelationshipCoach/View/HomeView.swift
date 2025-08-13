//
//  ContentView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 25/03/25.
//

import SwiftUI
import AVKit

struct RCIcon: View {
    let name: String
    let size: CGFloat
    let iconSize: CGFloat
    
    init(name: String,
         size: CGFloat = 48,
         iconSize: CGFloat = 28) {
        self.name = name
        self.size = size
        self.iconSize = iconSize
    }
    
    var body: some View {
        Image(RCAsset.icBackgroundCircle)
            .resizable()
            .frame(width: size, height: size)
            .overlay {
                Image(name)
                    .resizable()
                    .frame(width: iconSize, height: iconSize)
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: .black.opacity(0.62), radius: 13)
            }
    }
}

struct HomeView: View {
    
    @Environment(\.openURL) var openURL
    @EnvironmentObject var routeManager: RouteManager
    @ObservedObject var viewModel: HomeViewModel = .init()
    @AppStorage("gender") var gender: Gender = .female
    @State private var isSharing = false

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
                                
                                HStack {
                                    RCIcon(name: item.icon)
                                    
                                    VStack {
                                        Text(item.title)
                                            .font(.system(size: UIPreferences.text))
                                            .foregroundStyle(section.type.textColor(for: gender))
                                            .bold()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .frame(height: 50)
                                    Spacer()
                                    Image(RCAsset.icRightArrow)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .aspectRatio(contentMode: .fit)
                                }
                                .frame(height: 72)
                                .padding(.horizontal, 8)
                                .background(Color.backgroundColor)
                                .cornerRadius(16)
                                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 3)
                                .padding(4)
                                .padding(.horizontal, 8)
                                .onTapGesture {
                                    let section = viewModel.sections[sectionIndex]
                                    if section.type == .story {
                                        if let story = item.story {
                                            routeManager.routes.append(.story(story))
                                        } else if item.isSharing {
                                            self.isSharing = true
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
                        }
                    }
                }
            }
            .sheet(isPresented: $isSharing) {
                ShareSheet(activityItems: [appURL, appImage!])
            }

            .background(Color.backgroundColor)
            .onAppear {
                viewModel.prepareSections(for: gender)
                print("Updating the fonts")
//                uiManager.updateSettings()
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .story(let story):
                    StoryView(storyType: story)
                case .preference:
                    PreferencesView()
                case .coach:
                    AboutCoachView()
                case .privacyPolicy:
                    PrivacyPolicyView()
                case .termsAndConditions:
                    TermsAndConditionsView()
                case .changeGender:
                    ChangeGenderView()
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
//                case .uiSettings:
//                    UISettingsPreferenceView()
                }
            }
        }
        .accentColor(.white)
        
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
        .environmentObject(RouteManager())
}

func navigationTitleView(_ title: String) -> Text {
    Text(title)
        .font(.system(size: 20, weight: .bold, design: .default))
        .foregroundColor(Color.white)
}

extension HomeSectionType {
    func textColor(for gender: Gender) -> Color {
        switch self {
        case .story, .instagram, .preference:
//            return gender.color
            return Color.textColor
        case .web:
            return Color.textColor
        }
    }
}
