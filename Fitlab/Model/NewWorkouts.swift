//
//  NewWorkouts.swift
//  Fitlab
//
//  Created by Gul Kzm on 22.04.25.
//

import Foundation


// MARK: - NewWorkout
struct NewWorkouts: Codable {
    let data: [NewWorkout]
}

// MARK: - Datum
struct NewWorkout: Codable {
    let id, name, category, gender: String
    let image: String
    let videoURL: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, category, gender, image
        case videoURL = "videoUrl"
    }
}
