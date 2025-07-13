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
    
    @Test func sectionsForMale() async throws {
        sut.prepareSections(for: .male)
        #expect(sut.sections.count == 3)
    }
    
    @Test func sectionsForFemale() async throws {
        sut.prepareSections(for: .female)
        #expect(sut.sections.count == 3)
    }
    
    @Test func sectionsForNoGender() async throws {
        sut.prepareSections(for: .none)
        #expect(sut.sections.count == 3)
    }

}
