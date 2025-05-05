//
//  RecipeViewModel.swift
//  Fitlab
//
//  Created by Gul Kzm on 23.04.25.
//

import Foundation

class RecipeViewModel {
    private let manager = RecipeManager()
    var recipes: [Recipe] = []

    var success: (() -> Void)?
    var error: ((String) -> Void)?

    func getRecipeList() {
        manager.getRecipeList { result in
            self.recipes = result.data
            self.success?()
        }
    }

    func reset() {
        self.recipes.removeAll()
    }

    func recipe(at index: Int) -> Recipe {
        return recipes[index]
    }

    var numberOfRecipes: Int {
        return recipes.count
    }
}


