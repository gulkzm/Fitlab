//
//  NewWorkoutEndpoint.swift
//  Fitlab
//
//  Created by Gul Kzm on 22.04.25.
//
//
import Foundation

struct NewWorkoutEndpoint {
    static func fetchNewWorkouts(completion: @escaping (Result<NewWorkouts, Error>) -> Void) {
        NetworkHelper.shared.request("workouts/newest", method: .get, responseType: NewWorkouts.self, completion: completion)
    }
}

