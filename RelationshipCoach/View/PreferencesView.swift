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
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(Color.textColor)
                        .foregroundStyle(Color.backgroundColor)
                    
                    ForEach(0..<section.preferenceItem.count, id: \.self) { itemIndex in
                        let item = section.preferenceItem[itemIndex]
                        RelationshipCoachRowView(
                            title: item.type.title,
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
        .navigationTitle("Preferences")
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

#Preview {
    NavigationStack {
        PreferencesView()
    }
}
