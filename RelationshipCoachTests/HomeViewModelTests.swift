//
//  HomeViewModelTests.swift
//  RelationshipCoachTests
//
//  Created by Manikanta Nandam on 13/07/25.
//

import Testing
@testable import RelationshipCoach // Import your app module as @testable

@Suite("HomeViewModel Tests")
final class HomeViewModelTests {

    let sut = HomeViewModel()
    
    // Test the initial state of the view model.
    @Test("Initial state has no sections")
    func test_initialState_hasNoSections() {
        #expect(sut.sections.isEmpty)
    }

    // 2. Use a parameterized test to avoid repeating the same logic.
    @Test("Preparing sections for any gender results in 3 sections", arguments: [
        Gender.male,
        Gender.female,
        Gender.none
    ])
    func test_prepareSections_populatesSections(gender: Gender) {
        sut.prepareSections(for: gender)
        #expect(sut.sections.count == 3)
        
        // Test for section 1
        let section1 = sut.sections[0]
        #expect(section1.type == .story)
        #expect(section1.items.count == gender.expectedStoryItems)
        
        if section1.type == .story && gender == .male {
            let items = section1.items
            #expect(items[0].story == .herFault)
            #expect(items[1].story == .myFault)
            #expect(items[2].story == .toxic)
            #expect(items[3].story == .giving)
            #expect(items[4].story == .sweet)
            #expect(items[5].story == nil)
        }
        
        if section1.type == .story && gender == .female {
            let items = section1.items
            #expect(items[0].story == .hisFault)
            #expect(items[1].story == .myFault)
            #expect(items[2].story == .toxic)
            #expect(items[3].story == .receiving)
            #expect(items[4].story == .sweet)
            #expect(items[5].story == nil)
        }
        
        // Test for section 1
        let section2 = sut.sections[1]
        #expect(section2.type == .instagram)
        #expect(section2.items.count == 1)
        
        // Test for section 1
        let section3 = sut.sections[2]
        #expect(section3.type == .preference)
        #expect(section3.items.count == 1)
    }
}

extension Gender {
    var expectedStoryItems: Int {
        switch self {
        case .male:
            return 6
        case .female:
            return 6
        case .none:
            return 1
        }
    }
}
