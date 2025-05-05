//
//  Workout.swift
//  Fitlab
//
//  Created by Gul Kzm on 24.04.25.
//

import Foundation

// MARK: - Workout
struct Workouts: Codable {
    let data: [Workout]
    let pagination: WorkoutPagination
}

// MARK: - Datum
struct Workout: Codable {
    let id, name, category, gender: String
    let image: String
    let videoURL: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, category, gender, image
        case videoURL = "videoUrl"
    }
}

// MARK: - Pagination
struct WorkoutPagination: Codable {
    let page, limit, total, pages: Int
}
