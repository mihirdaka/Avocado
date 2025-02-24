//
//  recipeService.swift
//  Avocado
//
//  Created by Mihir Daka on 2/14/25.
//

import Foundation

final class RecipeService {
    static var endpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json";
    
    
    static func fetchRecipes() async throws -> [Recipe] {
        let url = URL(string: endpoint)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode([String: [Recipe]].self, from: data)
        return decoded["recipes"] ?? []
    }
}
