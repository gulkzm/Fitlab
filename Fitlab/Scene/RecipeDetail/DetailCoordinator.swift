//
//  DetailCoordinator.swift
//  Fitlab
//
//  Created by Gul Kzm on 24.04.25.
//

import UIKit
import Foundation

final class DetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var recipe: Recipe
    
    init(recipe: Recipe, navigationController: UINavigationController) {
        self.recipe = recipe
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(RecipeDetailController.self)") as! RecipeDetailController
        controller.selectedRecipe = recipe
        navigationController.show(controller, sender: nil)
    }
}
