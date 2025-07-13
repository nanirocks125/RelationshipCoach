//
//  UIPreferences.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 02/04/25.
//

import Foundation

struct UIPreferences: Codable, Equatable {
    var text: Int = 17
    var iconSize: Int  = 17
    var homePageItemsDescription: Int = 17
    var homePageWebLinks: Int = 17
    var homePageArrowSize: Int = 17
    var navigationTitleSize: Int = 17
    var storyHeadersOnStoryScreen: Int = 32
    var storyDescriptionOnStoryScreen: Int = 17
}
