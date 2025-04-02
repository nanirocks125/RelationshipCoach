//
//  UISettingsPreferenceView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 02/04/25.
//

import SwiftUI

struct UIPreferenceSelectView: View {
    
    let title: String
    let description: String

    @Binding var value: Int
    
    var body: some View {
        VStack {
            HStack {
                Stepper(title, value: $value)
                Text("\(value)")
            }
            Text(description)
        }
        
    }
}


struct UISettingsPreferenceView: View {
    @AppStorage("gender") var gender: Gender = .female
    
    @State var settings: UIPreferences = UIPreferences()
    
    @AppStorage("uiSettings") var uiSettings: Data?
    
    var body: some View {
        VStack(alignment: .leading) {
            UIPreferenceSelectView(
                title: "General Text Size",
                description: "overall text size of the app.",
                value: $settings.text
            )
            
            UIPreferenceSelectView(
                title: "Headers on Story Screen",
                description: "Size of header on story screen option like Real life examples, steps, conversation starters, coaching tips, do it yourself",
                value: $settings.storyHeadersOnStoryScreen
            )
            
            UIPreferenceSelectView(
                title: "Description on Story Screen",
                description: "Size of description on story screen option like Real life examples, steps, conversation starters, coaching tips, do it yourself",
                value: $settings.storyDescriptionOnStoryScreen
            )
            
            UIPreferenceSelectView(title: "Home Page Item Description",
                                   description: "Size for list of items on the starting screen",
                                   value: $settings.homePageItemsDescription)
            
            Spacer()
        }
        .padding()
        .onAppear {
            if let data = self.uiSettings {
                do {
                    self.settings = try JSONDecoder().decode(UIPreferences.self, from: data)
                } catch {
                    print("Error decoding UI settings: \(error)")
                }
            } else {
                self.settings = UIPreferences()
            }
        }
        .onChange(of: settings) {
            if let data = try? JSONEncoder().encode(self.settings) {
                self.uiSettings = data
            }
        }
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    UISettingsPreferenceView()
}
