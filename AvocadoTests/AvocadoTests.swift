//
//  AvocadoTests.swift
//  AvocadoTests
//
//  Created by Mihir Daka on 2/23/25.


import XCTest
@testable import Avocado

@MainActor
final class RecipeViewModelTests: XCTestCase {
    var viewModel: RecipeViewModel!

    override func setUp() {
        super.setUp()
        viewModel = RecipeViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testLoadMalformedData() async {
        // Mock RecipeService to return malformed data and verify the result
        RecipeService.endpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        
        await viewModel.loadRecipes()
        
        XCTAssertTrue(viewModel.recipes.isEmpty, "List should be empty.")
        XCTAssertEqual(viewModel.errorMessage, "Failed to load recipes.", "Failed to load recipes.")
    }

    func testLoadEmptyData() async {
        // Mock RecipeService to return empty data and verify the result
        RecipeService.endpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
        
        await viewModel.loadRecipes()
        
        XCTAssertTrue(viewModel.recipes.isEmpty, "List should be empty.")
        XCTAssertEqual(viewModel.errorMessage, "No recipes available.", "No recipes available.")
    }
}
