//
//  ConversationStartersView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct ConversationStartersView: View {
    @ObservedObject var viewModel = ConversationStartesViewModel()
    @AppStorage("gender") var gender: Gender = .female

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<viewModel.conversationStarters.count, id: \.self) { index in
                    let starter = viewModel.conversationStarters[index]
                    Text("\(index+1). \(starter.title)")
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(8)
                    Divider()
                    ForEach(0..<starter.statements.count, id:\.self) { statementIndex in
                        let statement = starter.statements[statementIndex]
                        
                        Text(statement.attributedStringForItems)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(8)
                            .padding(.trailing, 32)
                        Divider()
                    }
                }
            }
            .padding(8)
            .background(Color.rowBackgroundColor)
            .padding(16)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Coaching Starters")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .toolbarBackground(gender.color, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear {
                viewModel.prepareData(for: gender)
            }
        }
    }
}

#Preview {
    ConversationStartersView()
}
