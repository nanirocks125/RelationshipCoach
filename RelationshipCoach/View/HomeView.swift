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
//                                    if let storyType = section.items[itemIndex].storyType {
//                                        routeManager.routes.append(.story(type: storyType))
//                                    }
                                    routeManager.routes.append(.story)
                                }
                                
                                if section.type == .preference {
                                    routeManager.routes.append(.preference)
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
                case .story:
                    StoryView(storyType: .herFault)
                case .preference:
                    PreferencesView()
                case .coach:
                    Text("Coach")
                case .privacyPolicy:
                    Text("privacyPolicy")
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
