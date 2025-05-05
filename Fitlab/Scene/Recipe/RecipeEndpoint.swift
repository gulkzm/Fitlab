//
//  RecipeEndpoint.swift
//  Fitlab
//
//  Created by Gul Kzm on 23.04.25.
//

import Foundation

struct RecipeEndpoint {
    static func fetchRecipes(completion: @escaping (Result<Recipes, Error>) -> Void) {
        NetworkHelper.shared.request("recipes", method: .get, responseType: Recipes.self, completion: completion)
    }
}
