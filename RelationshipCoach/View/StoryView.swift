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
                        .foregroundStyle(Color.textColor)
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
        }
    }
}

struct StoryView: View {
    
    @ObservedObject var viewModel = StoryViewModel()
    @AppStorage("gender") var gender: Gender = .female
    @EnvironmentObject var routeManager: RouteManager
//    @EnvironmentObject var uiManager: UserSettingsPreferenceManager
    @State var storyType: StoryType
    
    @State var isPremiumSubscriptionPresenting = false
    
    init(storyType: StoryType) {
        self.storyType = storyType
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                ForEach(0..<viewModel.storySections.count, id: \.self) { index in
                    let storySection = viewModel.storySections[index]
                    let section = storySection.type
                    
                    HStack {
                        RelationshipCoachRowView(
                            title: section.title,
                            titleFontSize: UIPreferences.title,
                            description: section.description,
                            descriptionFontSize: UIPreferences.text,
                            theme: gender.color
                        )
                        
                        if storySection.enabled {
                            Image(RCAsset.icRightArrow)
                                .resizable()
                                .frame(width: 48, height: 48)
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 8)
                        } else {
                            RCIcon(name: RCAsset.lock, size: 24, iconSize: 28)
                                .padding(.horizontal, 20)
                        }
                        
                        
                    }
                    
                    .padding(.vertical, 2)
                    .onTapGesture {
                        if storySection.enabled {
                            routeManager.routes.append(section.route(for: storyType))
                        } else {
                            // Purchase Subscription
                            isPremiumSubscriptionPresenting = true
                        }
                    }
                }
                Spacer()
            }
            .padding(2)
        }
        .toolbarBackground(Color.backgroundColor, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(storyType.navigationTitle)
                    .foregroundColor(Color.textColor)
                    .bold()
            }
        }
        .fullScreenCover(isPresented: $isPremiumSubscriptionPresenting) {
            PurchasePremium()
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
