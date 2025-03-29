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
                                    .foregroundStyle(section.type.textColor)
                                    .bold()
                                Spacer()
                                Image(systemName: "arrow.right")
                            }
                            .padding(.vertical, 18)
                            .padding(.horizontal, 8)
                            .onTapGesture {
                                let section = viewModel.sections[sectionIndex]
                                if section.type == .story {
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
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .story:
                    StoryView()
                case .preference:
                    PreferencesView()
                case .coach:
                    Text("Coach")
                case .privacyPolicy:
                    Text("privacyPolicy")
                case .termsAndConditions:
                    Text("termsAndConditions")
                case .changeGender:
                    Text("changeGender")
                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}

extension HomeSectionType {
    var textColor: Color {
        switch self {
        case .story, .instagram, .preference:
            return .pink
        case .web:
            return .black
        }
    }
}
