//
//  recipeViewModel.swift
//  Avocado
//
//  Created by Mihir Daka on 2/14/25.
//

import Foundation


@MainActor
final class RecipeViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadRecipes() async {
        guard !isLoading else { return } // prevent multiple calls
        isLoading = true
        errorMessage = nil
        do {
            recipes = try await RecipeService.fetchRecipes()
            if recipes.isEmpty {
                errorMessage = "No recipes available."
            }
        } catch {
            errorMessage = "Failed to load recipes."
        }
        isLoading = false
    }
}
