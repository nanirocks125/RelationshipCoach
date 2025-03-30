//
//  StepsViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation

class StepsViewModel: ObservableObject {
    @Published var header = "He did or said something wrong. Memorize the 6 steps below to lovingly call him out:"
    @Published var steps: [String] = [
        "Heart Feeling/fact",
        "Body Feeling",
        "Negative self-feeling statement",
        "Call to Action",
        "Clarification",
        "Appreciation"
    ]
    
}
