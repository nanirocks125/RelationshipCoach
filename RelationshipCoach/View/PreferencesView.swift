//
//  PreferencesView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var routeManager: RouteManager
    @ObservedObject var viewModel = PreferenceViewModel()
    @AppStorage("gender") var gender: Gender = .female

    var body: some View {
            VStack {
                ForEach(0..<viewModel.sections.count, id: \.self) { sectionIndex in
                    let section = viewModel.sections[sectionIndex]
                    Text(section.type.title)
                        .frame(maxWidth: .infinity, maxHeight: section.maxHeight)
                        .background(Color(hex: 0xd3cccc, opacity: 1))
                        .foregroundStyle(Color.textColor)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    
                    ForEach(0..<section.preferenceItem.count, id: \.self) { itemIndex in
                        let item = section.preferenceItem[itemIndex]
                        RelationshipCoachRowView(
                            title: item.type.title,
                            titleFont: .subheadline,
                            theme: Color.textColor
                        )
                            .onTapGesture {
                                let section = viewModel.sections[sectionIndex]
                                let item = section.preferenceItem[itemIndex]
                                routeManager.routes.append(item.type.preferenceRoute)
                            }
                        
                    }
                }
                Spacer()
            }
            .background(Color.backgroundColor)
            .padding(.vertical)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Preferences")
                        .foregroundColor(.white)
                }
            }
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

extension PreferenceSection {
    var maxHeight: Double {
        switch type {
        case .copyright:
            return 50
        default:
            return 30
        }
    }
}

#Preview {
    NavigationStack {
        PreferencesView()
    }
}
