//
//  StoryView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 25/03/25.
//

import SwiftUI

struct RelationshipCoachRowView: View {
    let title: String
    let description: String?
    let theme: Color
    
    init(title: String, description: String? = nil, theme: Color) {
        self.title = title
        self.description = description
        self.theme = theme
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Group {
                    Text(title)
                        .font(.title)
                        .foregroundStyle(theme)
                    if let description = description {
                        Text(description)
                            .font(.footnote)
                            .padding(.vertical, 2)
                    }
                    
                    Rectangle()
                        .frame(height: 1)
                        .background(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(.gray.opacity(0.2))
            Image(systemName: "arrow.right")
                .padding(.horizontal, 24)
        }
    }
}

struct StoryView: View {
    
    @ObservedObject var viewModel = StoryViewModel()
    @AppStorage("gender") var gender: Gender = .female
    @EnvironmentObject var routeManager: RouteManager
    
    var body: some View {
        VStack(alignment: .center) {
            ForEach(0..<viewModel.sections.count, id: \.self) { index in
                let section = viewModel.sections[index]
                RelationshipCoachRowView(
                    title: section.title,
                    description: section.description,
                    theme: gender.color
                )
                .padding(.vertical, 2)
                .onTapGesture {
                    routeManager.routes.append(section.route)
                }
            }
            Spacer()
        }
        .toolbarColorScheme(ColorScheme.dark, for: .navigationBar)
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .onAppear {
            // Ensuring the color persists
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().tintColor = UIColor.white // Affects back button and bar items
        }

    }
}

extension StorySectionType {
    var route: Route {
        switch self {
        case .realLifeExamples:
            return .realLifeExamples
        case .steps:
            return .steps
        case .conversationStarters:
            return .conversationStarters
        case .coachingTips:
            return .coachingTips
        case .doItYourSelf:
            return .doItYourSelf
        }
    }
}

#Preview {
    StoryView()
}
