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
                    Text(section.attributedString(for: gender))
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
    
    func attributedString(for gender: Gender) -> AttributedString {
        switch type {
        case .copyright:
            var string = AttributedString(type.title)
            if let linkRange = string.range(of: "Relationship Coach Camille") {
                string[linkRange].link = URL(string: "https://relationshipcoachllc.com/")
                string[linkRange].foregroundColor = UIColor(gender.color)
                string[linkRange].underlineColor = UIColor(gender.color)
                string[linkRange].underlineStyle = .single
                string[linkRange].font = .system(size: 17, weight: .bold)
            }
            
            return string
        default:
            return AttributedString(type.title)
        }
    }
    
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
