//
//  RealLifeExamplesView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct RealLifeExamplesView: View {
    @AppStorage("gender") var gender: Gender = .female
    let story: StoryType
    @ObservedObject var viewModel = RealLifeExamplesViewModel()
    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var uiManager: UserSettingsPreferenceManager

    init(story: StoryType) {
        self.story = story
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<viewModel.realLifeStories.count, id: \.self) { index in
                    Group {
                        Text("Real Life Example \(index + 1):")
                            .font(.title2)
                            .bold()
                            .padding(.vertical)
                        let story = viewModel.realLifeStories[index]
                        Text(story.title)
                            .font(.system(size: UIPreferences.text))
                            .foregroundStyle(story.authorGender.color)
                            .bold()
                            .padding(.bottom, 16)
                        ForEach(0..<story.statements.count, id: \.self) { statementIndex in
                            let statement = story.statements[statementIndex]
                            HStack(alignment: .top) {
                                Circle()
                                    .frame(width: 8, height: 8)
                                    .padding(.top, 6)
                                VStack {
                                    Text(statement.attributedString(with: UIPreferences.text))
                                        .lineSpacing(4)
                                        
                                    Spacer()
                                }
                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            }
            .padding()
        }
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Real Life Examples")
                    .foregroundColor(.white)
                    .bold()
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Go back
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("\(story.navigationTitle)") // Custom text
                    }
                }
            }
        }
        .onAppear {
            viewModel.prepareData(for: gender, story: story)
        }
    }
}

extension StoryStatement {
    func attributedString(with size: CGFloat) -> AttributedString {
        var finalString = AttributedString("")
        
        var header = AttributedString("\(genderSource.headerText)")
        header.foregroundColor = Color.textColor
        header.font = .systemFont(ofSize: size, weight: .bold)
        
        finalString += header
        
        finalString += attributedStringForItems(with: size)

        return finalString
    }
    
    func attributedStringForItems(with size: CGFloat) -> AttributedString {
        var finalString = AttributedString("")
        if items.count == 0 {
            return finalString
        }
        
        if items.count > 1 {
            for index in 0..<items.count {
                var description: AttributedString
                if index == 0 {
                    description = AttributedString("\"\(items[index].description)")
                } else if index == items.count - 1 {
                    description = AttributedString(" \(items[index].description)\"")
                } else {
                    description = AttributedString(" \(items[index].description)")
                }
                description.font = .systemFont(ofSize: size)
                finalString += description
                
                var itemDisplayString = AttributedString(" \(items[index].displayString)")
                itemDisplayString.font = .systemFont(ofSize: size, weight: .bold)
                itemDisplayString.foregroundColor = genderSource.color
                finalString += itemDisplayString
            }
            
        } else {
            var description = AttributedString("\"\(items[0].description)\"")
            description.font = .systemFont(ofSize: size)
            finalString += description
            
            var itemDisplayString = AttributedString(" \(items[0].displayString)")
            itemDisplayString.font = .systemFont(ofSize: size, weight: .bold)
            itemDisplayString.foregroundColor = genderSource.color
            finalString += itemDisplayString
        }
        


        return finalString
    }
}

extension Gender {
    var headerText: String {
        switch self {
        case .male:
            "He Said: "
        case .female:
            "She Said: "
        case .none:
            ""
        }
    }
}

#Preview {
    RealLifeExamplesView(story: .giving)
}
