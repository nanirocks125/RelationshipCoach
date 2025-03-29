//
//  DoItYourSelfView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

struct DoItYourSelfView: View {
    @ObservedObject var viewModel = DoItYourSelfViewModel()
    var body: some View {
        Text("DoItYourSelfView")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Add new item")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
    }
}

#Preview {
    DoItYourSelfView()
}
