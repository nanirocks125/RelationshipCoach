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
    @EnvironmentObject var uiManager: UserSettingsPreferenceManager
    
    var body: some View {
            VStack {
                ForEach(0..<viewModel.sections.count, id: \.self) { sectionIndex in
                    let section = viewModel.sections[sectionIndex]
                    HStack {
                        Text(section.attributedString(for: gender, size: uiManager.settings.text))
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: 0xd3cccc, opacity: 1))
                            .foregroundStyle(Color.textColor)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                    }
                    .frame(height: section.maxHeight * Double(uiManager.settings.text))
                    .background(Color(hex: 0xd3cccc, opacity: 1))
                    .foregroundStyle(Color.textColor)
                    
                    
                    ForEach(0..<section.preferenceItem.count, id: \.self) { itemIndex in
                        let item = section.preferenceItem[itemIndex]
                        RelationshipCoachRowView(
                            title: item.type.title,
                            titleFontSize: uiManager.settings.text.cgFloat,
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
                        .onTapGesture(count: 3) {
                            viewModel.showUISettings.toggle()
                        }
                }
            }
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

extension PreferenceSection {
    
    func attributedString(for gender: Gender, size: Int) -> AttributedString {
        switch type {
        case .copyright:
            var string = AttributedString(type.title)
            string.font = .system(size: CGFloat(size))
            if let linkRange = string.range(of: "Relationship Coach Camille") {
                string[linkRange].link = URL(string: "https://relationshipcoachllc.com/")
                string[linkRange].foregroundColor = UIColor(gender.color)
                string[linkRange].underlineColor = UIColor(gender.color)
                string[linkRange].underlineStyle = .single
                string[linkRange].font = .system(size: CGFloat(size), weight: .bold)
            }
            
            return string
        default:
            var string = AttributedString(type.title)
            string.font = .system(size: CGFloat(size))
            return string
        }
    }
    
    var maxHeight: Double {
        switch type {
        case .copyright:
            return 5.5
        default:
            return 2
        }
    }
}

#Preview {
    NavigationStack {
        PreferencesView()
    }
}
