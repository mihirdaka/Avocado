//
//  recipeData.swift
//  Avocado
//
//  Created by Mihir Daka on 2/14/25.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id: UUID
    let name: String
    let cuisine: String
    let photoURLSmall: URL?
    let photoURLLarge: URL?
    let sourceURL: URL?
    let youtubeURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name, cuisine
        case photoURLSmall = "photo_url_small"
        case photoURLLarge = "photo_url_large"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
    
    var isValid: Bool {
            !name.isEmpty && !cuisine.isEmpty && id != UUID()
    }
}
