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
    }
}
