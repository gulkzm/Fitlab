//
//  HomeViewModel.swift
//  Fitlab
//
//  Created by Gul Kzm on 02.04.25.
//

import Foundation

enum HomeSectionTitle: String {
    case newrecipes = "New Recipes"
    case newworkouts = "New Workouts"
}

struct HomeTitleModel {
    let type: HomeSectionTitle
}

struct HomeModel {
    let title: HomeTitleModel
    let recipes: [NewRecipe]
}

struct WorkoutModel {
    let title: HomeTitleModel
    let workouts: [NewWorkout]
}

class HomeViewModel {
    var newItems = [HomeModel]()
    var newData = [WorkoutModel]()
    
    let manager = HomeManager()
    
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getNewRecipes(completion: @escaping (NewRecipes) -> Void) {
        NewRecipeEndpoint.fetchNewRecipes { result in
            switch result {
            case .success(let recipes):
                self.newItems.append(.init(title: .init(type: .newrecipes), recipes: recipes.data))

                completion(recipes)
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
                self.newData.append(.init(title: .init(type: .newworkouts), workouts: workouts.data))

                completion(workouts)
            case .failure(let error):
                print("❌ Failed to load workouts:", error)
                completion(NewWorkouts(data: []))
            }
        }
    }
}
