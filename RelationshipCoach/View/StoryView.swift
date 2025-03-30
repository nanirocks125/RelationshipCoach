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
            VStack(alignment: .center, spacing: 8) {
                Group {
                    Text(title)
                        .font(.title)
                        .foregroundStyle(theme)
                    if let description = description {
                        Text(description)
                            .font(.system(size: 14))
                            .padding(.vertical, 2)
                            .foregroundStyle(Color.rowDescriptionColor)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(8)
            .overlay(
                Rectangle()
                    .frame(height: 1) // Border thickness
                    .foregroundColor(.white),
                alignment: .bottom
            )
            .background(Color.rowBackgroundColor)
            Image(systemName: "arrow.right")
                .resizable()
                .frame(width: 12, height: 12)
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 24)
        }
    }
}

struct StoryView: View {
    
    @ObservedObject var viewModel = StoryViewModel()
    @AppStorage("gender") var gender: Gender = .female
    @EnvironmentObject var routeManager: RouteManager
    @State var storyType: StoryType
    init(storyType: StoryType) {
        self.storyType = storyType
    }
    var body: some View {
        ScrollView {
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
                        routeManager.routes.append(section.route(for: storyType))
                    }
                }
                Spacer()
            }
            .padding(2)
        }
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(storyType.navigationTitle)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

extension StoryType {
    var navigationTitle: String {
        switch self {
        case .hisFault:
            "His Fault"
        case .herFault:
            "Her Falut"
        case .myFault:
            "My Falut"
        case .toxic:
            "Toxic Chat"
        case .giving:
            "Giving Talk"
        case .receiving:
            "Receiving Talk"
        case .sweet:
            "Sweet Talk"
        }
    }
}

extension StorySectionType {
    func route(for story: StoryType) -> Route {
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
            return .doItYourSelf(story)
        }
    }
}

#Preview {
    StoryView(storyType: .herFault)
}
