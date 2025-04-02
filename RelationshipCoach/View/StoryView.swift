//
//  StoryView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 25/03/25.
//

import SwiftUI

struct RelationshipCoachRowView: View {
    let title: String
    let titleFontSize: CGFloat
    let description: String?
    let descriptionFontSize: CGFloat
    let theme: Color

    init(title: String,
         titleFontSize: CGFloat,
         description: String? = nil,
         descriptionFontSize: CGFloat = 0.0,
         theme: Color) {
        self.title = title
        self.titleFontSize = titleFontSize
        self.description = description
        self.descriptionFontSize = descriptionFontSize
        self.theme = theme
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 8) {
                Group {
                    Text(title)
                        .font(.system(size: titleFontSize))
                        .foregroundStyle(theme)
                    if let description = description {
                        Text(description)
                            .font(.system(size: descriptionFontSize))
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
    @EnvironmentObject var uiManager: UserSettingsPreferenceManager
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
                        titleFontSize: uiManager.settings.storyHeadersOnStoryScreen.cgFloat,
                        description: section.description,
                        descriptionFontSize: uiManager.settings.storyDescriptionOnStoryScreen.cgFloat,
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
            "Her Fault"
        case .myFault:
            "My Fault"
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
            return .realLifeExamples(story)
        case .steps:
            return .steps(story)
        case .conversationStarters:
            return .conversationStarters(story)
        case .coachingTips:
            return .coachingTips(story)
        case .doItYourSelf:
            return .doItYourSelf(story)
        }
    }
}

#Preview {
    StoryView(storyType: .herFault)
}
