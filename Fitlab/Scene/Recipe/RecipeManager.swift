//
//  RecipeManager.swift
//  Fitlab
//
//  Created by Gul Kzm on 23.04.25.
//

import Foundation


class RecipeManager {
    func getRecipeList(completion: @escaping (Recipes) -> Void) {
        RecipeEndpoint.fetchRecipes { result in
            switch result {
            case .success(let recipes):
                completion(recipes)
            case .failure(let error):
                print("❌ Failed to load all recipes:", error)
                completion(Recipes(data: [], pagination: RecipesPagination(page: 1, limit: 10, total: 0, pages: 0)))
            }
        }
    }
}


