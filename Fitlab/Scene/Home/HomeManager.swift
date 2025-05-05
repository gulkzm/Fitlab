//
//  HomeManager.swift
//  Fitlab
//
//  Created by Gul Kzm on 22.04.25.
//
import Foundation

class HomeManager {
    func getNewRecipes(completion: @escaping (NewRecipes) -> Void) {
        NewRecipeEndpoint.fetchNewRecipes { result in
            switch result {
            case .success(let recipes):
                completion(recipes);
                
            case .failure(let error):
                print("❌ Failed to load recipes:", error)
                completion(NewRecipes(data: [])) 
            }
        }
    }

    func getNewWorkouts(completion: @escaping (NewWorkouts) -> Void) {
        NewWorkoutEndpoint.fetchNewWorkouts { result in
            switch result {
            case .success(let workouts):
                completion(workouts);
                
            case .failure(let error):
                print("❌ Failed to load workouts:", error)
                completion(NewWorkouts(data: []))
            }
        }
    }
}
