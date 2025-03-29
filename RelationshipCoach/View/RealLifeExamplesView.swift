//
//  RealLifeExamplesView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct RealLifeExamplesView: View {
    @AppStorage("gender") var gender: Gender = .female
    @ObservedObject var viewModel = RealLifeExamplesViewModel()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<viewModel.realLifeStories.count, id: \.self) { index in
                    Group {
                        Text("Real Life Example \(index + 1):")
                            .font(.title)
                            .bold()
                        let story = viewModel.realLifeStories[index]
                        Text(story.title)
                            .foregroundStyle(story.authorGender.color)
                        ForEach(0..<story.statements.count, id: \.self) { statementIndex in
                            let statement = story.statements[statementIndex]
                            HStack(alignment: .top) {
                                Circle()
                                    .frame(width: 8, height: 8)
                                    .padding(.top, 8)
                                VStack {
                                    Text(statement.attributedString)
                                        
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
        .onAppear {
            viewModel.prepareData(for: gender)
        }
    }
}

extension StoryStatement {
    var attributedString: AttributedString {
        var finalString = AttributedString("")
        
        var header = AttributedString("\(genderSource.headerText):")
        header.foregroundColor = .black
        header.font = .boldSystemFont(ofSize: 14)
        
        finalString += header
        
        for item in items {
            var description = AttributedString("\(item.description)")
            header.font = .boldSystemFont(ofSize: 14)
            finalString += description
            
            var itemDisplayString = AttributedString(" \(item.displayString)")
            itemDisplayString.font = .boldSystemFont(ofSize: 14)
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
            "He Said"
        case .female:
            "She Said"
        }
    }
}

#Preview {
    RealLifeExamplesView()
}
