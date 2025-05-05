//
//  Recipe.swift
//  Fitlab
//
//  Created by Gul Kzm on 23.04.25.
//
import Foundation

// MARK: - Recipe
//struct Recipes: Codable {
//    let data: [Recipe]
//    let pagination: RecipesPagination
//}
//
//// MARK: - Recipe
//struct Recipe: Codable {
//    let id, name: String
//    let image: String
//    let description: String
//    let prepTime: PrepTime
//    let cookingTime: CookingTime
//    let ingredients: [Ingredient]
//    let instructions: [Instruction]
//    let videoURL: String
//    let category: Category
//    let difficulty: Difficulty
//    let mealType: [MealType]
//    let tags: [Tag]
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case name, image, description, prepTime, cookingTime, ingredients, instructions
//        case videoURL = "videoUrl"
//        case category, difficulty, mealType, tags
//    }
//}
//
//struct RecipesPagination: Codable {
//    let page, limit, total, pages: Int
//}
//
//enum Category: String, Codable {
//    case dinner = "Dinner"
//}
//
//enum CookingTime: String, Codable {
//    case the30Minutes = "30 minutes"
//}
//
//enum Difficulty: String, Codable {
//    case easy = "easy"
//    case hard = "hard"
//}
//
//// MARK: - Ingredient
//struct Ingredient: Codable {
//    let name: Name
//    let quantity: String
//    let unit: Unit
//}
//
//enum Name: String, Codable {
//    case blackPepper = "Black Pepper"
//    case garlic = "Garlic"
//    case oliveOil = "Olive Oil"
//    case salt = "Salt"
//    case vegetables = "Vegetables"
//}
//
//enum Unit: String, Codable {
//    case cloves = "cloves"
//    case cups = "cups"
//    case empty = ""
//    case tbsp = "tbsp"
//}
//
//enum Instruction: String, Codable {
//    case addChoppedVegetablesAndCookUntilTender = "Add chopped vegetables and cook until tender."
//    case addGarlicAndSautéFor1Minute = "Add garlic and sauté for 1 minute."
//    case heatOliveOilInAPan = "Heat olive oil in a pan."
//    case seasonWithSaltAndPepper = "Season with salt and pepper."
//    case serveWarm = "Serve warm."
//}
//
//enum MealType: String, Codable {
//    case healthy = "Healthy"
//    case vegan = "Vegan"
//}
//
//enum PrepTime: String, Codable {
//    case the15Minutes = "15 minutes"
//}
//
//enum Tag: String, Codable {
//    case lowCalorie = "Low-Calorie"
//    case nutritious = "Nutritious"
//    case simple = "Simple"
//}


import Foundation

// MARK: - Recipe
struct Recipes: Codable {
    let data: [Recipe]
    let pagination: RecipesPagination
}

// MARK: - Datum
struct Recipe: Codable {
    let id, name: String
    let image: String
    let description, prepTime, cookingTime, calories: String
    let ingredients: [Ingredient]
    let instructions: [Instruction]
    let videoURL: String
    let category: Category
    let difficulty: Difficulty
    let mealType: [MealType]
    let tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, image, description, prepTime, cookingTime, calories, ingredients, instructions
        case videoURL = "videoUrl"
        case category, difficulty, mealType, tags
    }
}

enum Category: String, Codable {
    case dinner = "Dinner"
}

enum Difficulty: String, Codable {
    case easy = "easy"
    case hard = "hard"
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let name: Name
    let quantity: String
    let unit: Unit
}

enum Name: String, Codable {
    case blackPepper = "Black Pepper"
    case garlic = "Garlic"
    case oliveOil = "Olive Oil"
    case salt = "Salt"
    case vegetables = "Vegetables"
}

enum Unit: String, Codable {
    case cloves = "cloves"
    case cups = "cups"
    case empty = ""
    case tbsp = "tbsp"
}

enum Instruction: String, Codable {
    case addChoppedVegetablesAndCookUntilTender = "Add chopped vegetables and cook until tender."
    case addGarlicAndSautéFor1Minute = "Add garlic and sauté for 1 minute."
    case heatOliveOilInAPan = "Heat olive oil in a pan."
    case seasonWithSaltAndPepper = "Season with salt and pepper."
    case serveWarm = "Serve warm."
}

enum MealType: String, Codable {
    case healthy = "Healthy"
    case vegan = "Vegan"
}

enum Tag: String, Codable {
    case lowCalorie = "Low-Calorie"
    case nutritious = "Nutritious"
    case simple = "Simple"
}

// MARK: - Pagination
struct RecipesPagination: Codable {
    let page, limit, total, pages: Int
}

