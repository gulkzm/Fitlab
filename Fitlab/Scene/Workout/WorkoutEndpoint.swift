//
//  WorkoutEndpoint.swift
//  Fitlab
//
//  Created by Gul Kzm on 24.04.25.
//

import Foundation

struct WorkoutEndpoint {
    static func fetchWorkouts(completion: @escaping (Result<Workouts, Error>) -> Void) {
        NetworkHelper.shared.request("workouts", method: .get, responseType: Workouts.self, completion: completion)
    }
}
