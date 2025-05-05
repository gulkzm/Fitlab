//
//  WorkoutViewModel.swift
//  Fitlab
//
//  Created by Gul Kzm on 24.04.25.
//

import Foundation

class WorkoutViewModel {
    private let manager = WorkoutManager()
    var workouts: [Workout] = []

    var success: (() -> Void)?
    var error: ((String) -> Void)?

    func getWorkoutList() {
        manager.getWorkoutList { result in
            self.workouts = result.data
            self.success?()
        }
    }

    func reset() {
        self.workouts.removeAll()
    }

    func workout(at index: Int) -> Workout {
        return workouts[index]
    }

    var numberOfWorkouts: Int {
        return workouts.count
    }
}

