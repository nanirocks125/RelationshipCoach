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
                        HStack {
                            VStack {
                                Text(item.type.title)
                                    .frame(maxWidth: .infinity, maxHeight: 40)
                                    .background(Color.backgroundColor)
                                    .foregroundStyle(Color.textColor)
                                
                                if itemIndex < section.preferenceItem.count - 1 {
                                    Divider()
                                        .frame(height: 1)
                                        .background(Color.textColor)
                                        .padding(.horizontal)
                                }
                                
                            }
                            Image(systemName: "arrow.right")
                        }
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
    }
}

#Preview {
    NavigationStack {
        PreferencesView()
    }
}
