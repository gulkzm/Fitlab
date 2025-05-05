//
//  HomeEndpoint.swift
//  Fitlab
//
//  Created by Gul Kzm on 21.04.25.
//

import Foundation

struct NewRecipeEndpoint {
    static func fetchNewRecipes(completion: @escaping (Result<NewRecipes, Error>) -> Void) {
        NetworkHelper.shared.request("recipes/newest", method: .get, responseType: NewRecipes.self, completion: completion)
    }
}
