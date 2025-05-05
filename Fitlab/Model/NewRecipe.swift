////
////  NewRecipe.swift
////  Fitlab
////
////  Created by Gul Kzm on 21.04.25.
////
//
//import Foundation
//
//
//// MARK: - NewRecipe
//struct NewRecipes: Codable {
//    let data: [NewRecipe]
//}
//
//// MARK: - NewRecipe
//struct NewRecipe: Codable {
//    let id, name: String
//    let image: String
//    let description, prepTime, cookingTime: String
//    let ingredients: [Ingredient]
//    let instructions: [String]
//    let videoURL, category, difficulty: String
//    let mealType: [MealType]
//    let tags: [Tag]
//    
//    var titleText: String {
//        name ?? ""
//    }
//    
//    var imageURL: String {
//        image ?? ""
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case name, image, description, prepTime, cookingTime, ingredients, instructions
//        case videoURL = "videoUrl"
//        case category, difficulty, mealType, tags
//    }
//}
//
//// MARK: - Ingredient
//struct Ingredient: Codable {
//    let name, quantity: String
//    let unit: Unit
//}
//
//enum Unit: String, Codable {
//    case cloves = "cloves"
//    case cups = "cups"
//    case empty = ""
//    case tbsp = "tbsp"
//}
//
//enum MealType: String, Codable {
//    case healthy = "Healthy"
//    case vegan = "Vegan"
//}
//
//enum Tag: String, Codable {
//    case lowCalorie = "Low-Calorie"
//    case nutritious = "Nutritious"
//    case simple = "Simple"
//}


//struct NewRecipes: Codable {
//    let data: [NewRecipe]
//}
//
//struct NewRecipe: Codable {
//    let id, name: String
//    let image: String
//    let description, prepTime, cookingTime: String
//    let ingredients: [NewIngredient]
//    let instructions: [String]
//    let videoURL, category, difficulty: String
//    let mealType: [NewMealType]
//    let tags: [NewTag]
//
//    var titleText: String { name }
//    var imageURL: String { image }
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case name, image, description, prepTime, cookingTime, ingredients, instructions
//        case videoURL = "videoUrl"
//        case category, difficulty, mealType, tags
//    }
//}
//
//struct NewIngredient: Codable {
//    let name, quantity: String
//    let unit: NewUnit
//}
//
//enum NewUnit: String, Codable {
//    case cloves = "cloves"
//    case cups = "cups"
//    case empty = ""
//    case tbsp = "tbsp"
//}
//
//enum NewMealType: String, Codable {
//    case healthy = "Healthy"
//    case vegan = "Vegan"
//}
//
//enum NewTag: String, Codable {
//    case lowCalorie = "Low-Calorie"
//    case nutritious = "Nutritious"
//    case simple = "Simple"
//}
//
//
import Foundation

// MARK: - NewRecipe
struct NewRecipes: Codable {
    let data: [NewRecipe]
}

// MARK: - Datum
struct NewRecipe: Codable {
    let id, name: String
    let image: String
    let description, prepTime, cookingTime, calories: String
    let ingredients: [NewIngredient]
    let instructions: [String]
    let videoURL, category, difficulty: String
    let mealType: [NewMealType]
    let tags: [NewTag]

    var titleText: String { name }
    var imageURL: String { image }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, image, description, prepTime, cookingTime, calories, ingredients, instructions
        case videoURL = "videoUrl"
        case category, difficulty, mealType, tags
    }
}

// MARK: - Ingredient
struct NewIngredient: Codable {
    let name, quantity: String
    let unit: NewUnit
}

enum NewUnit: String, Codable {
    case cloves = "cloves"
    case cups = "cups"
    case empty = ""
    case tbsp = "tbsp"
}

enum NewMealType: String, Codable {
    case healthy = "Healthy"
    case vegan = "Vegan"
}

enum NewTag: String, Codable {
    case lowCalorie = "Low-Calorie"
    case nutritious = "Nutritious"
    case simple = "Simple"
}
