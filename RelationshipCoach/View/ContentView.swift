//
//  ContentView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 13/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            PreferencesView()
                .tabItem {
                    Label("Preferences", systemImage: "house")
                }

        }
    }
}

#Preview {
    ContentView()
}
