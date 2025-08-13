//
//  ContentView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 13/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("gender") var gender: Gender = .female
    init() {
        // Change selected tab item color
        UITabBar.appearance().tintColor = UIColor(gender.color)
        
        // Optional: Change unselected tab item color
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }

    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            PreferencesView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .tint(gender.color)
    }
}

#Preview {
    ContentView()
}
