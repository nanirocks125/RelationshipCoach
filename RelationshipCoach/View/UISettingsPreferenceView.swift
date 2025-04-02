//
//  UISettingsPreferenceView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 02/04/25.
//

import SwiftUI

struct UIPreferenceSelectView: View {
    
    let title: String
    @Binding var value: Int
    
    var body: some View {
        HStack {
            Stepper(title, value: $value)
            Text("\(value)")
        }
    }
}


struct UISettingsPreferenceView: View {
    @AppStorage("gender") var gender: Gender = .female
    
    @State var settings: UIPreferences = UIPreferences()
    
    @AppStorage("uiSettings") var uiSettings: Data?
    
    var body: some View {
        VStack {
            UIPreferenceSelectView(
                title: "Text",
                value: $settings.text
            )
            
            UIPreferenceSelectView(
                title: "Headers on Story Screen",
                value: $settings.storyHeadersOnStoryScreen
            )
            
            UIPreferenceSelectView(
                title: "Description on Story Screen",
                value: $settings.storyDescriptionOnStoryScreen
            )
        }
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
    }
}

#Preview {
    UISettingsPreferenceView()
}
