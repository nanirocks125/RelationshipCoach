//
//  StoryViewModel.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import Foundation
import Combine

enum StorySectionType {
    case realLifeExamples
    case steps
    case conversationStarters
    case coachingTips
    case doItYourSelf
}

extension StorySectionType {
    var title: String {
        switch self {
        case .realLifeExamples:
            return "Real Life Examples"
        case .steps:
            return "Steps"
        case .conversationStarters:
            return "Conversation Starters"
        case .coachingTips:
            return "Coaching Tips"
        case .doItYourSelf:
            return "Do It Yourself"
        }
    }
    var description: String {
        switch self {
        case .realLifeExamples:
            return "Real life examples you can use."
        case .steps:
            return "The six steps you can follow."
        case .conversationStarters:
            return "More examples of each step."
        case .coachingTips:
            return "Helpful tips from the expert."
        case .doItYourSelf:
            return "Practice the steps yourself!"
        }
    }
}

struct StorySecton {
    var type: StorySectionType
}

struct StorySection: Identifiable {
    let id: UUID = UUID()
    let type: StorySectionType
    let enabled: Bool
    
    init(type: StorySectionType, enabled: Bool = true) {
        self.type = type
        self.enabled = enabled
    }
}

@MainActor
class StoryViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    private let storeManager = StoreManager()
    
    init() {
        prepareSections(with: false)
        
        storeManager.$premiumUser
            .sink { [weak self] premiumUser in
                self?.prepareSections(with: premiumUser)
            }.store(in: &cancellables)
        
    }
    
    @Published var storySections: [StorySection] = []
    
    func prepareSections(with premiumUser: Bool) {
        storySections = [
            .init(type: .realLifeExamples),
            .init(type: .steps, enabled: premiumUser),
            .init(type: .conversationStarters, enabled: premiumUser),
            .init(type: .coachingTips, enabled: premiumUser),
            .init(type: .doItYourSelf, enabled: premiumUser)
        ]
    }
    
}
