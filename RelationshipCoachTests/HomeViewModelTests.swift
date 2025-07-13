//
//  HomeViewModelTests.swift
//  RelationshipCoachTests
//
//  Created by Manikanta Nandam on 13/07/25.
//

import Testing
import RelationshipCoach

struct HomeViewModelTests {
    
    let sut: HomeViewModel
    
    init() {
        self.sut = HomeViewModel()
    }

    @Test func initialSections() async throws {
        #expect(sut.sections.count == 0)
    }

}
