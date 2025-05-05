//
//  WorkoutManager.swift
//  Fitlab
//
//  Created by Gul Kzm on 24.04.25.
//

import Foundation

class WorkoutManager {
    func getWorkoutList(completion: @escaping (Workouts) -> Void) {
        WorkoutEndpoint.fetchWorkouts { result in
            switch result {
            case .success(let workouts):
                completion(workouts)
            case .failure(let error):
                print("❌ Failed to load all recipes:", error)
                completion(Workouts(data: [], pagination: WorkoutPagination(page: 1, limit: 10, total: 0, pages: 0)))
            }
        }
    }
}
