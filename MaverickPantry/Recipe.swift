//
//  Recipe.swift
//  MaverickPantry
//
//  Created by Justine Linscott on 8/12/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import Foundation

class Recipe {
    var recipeName : String?
    var ingredients : [String]?
    var recipeTime  : String?
    var cookTime : String?
    var image : String?
    var recipeDescription : String?
    var recipeDirections : [String]?
    var recipeServing : String?
    
    init(recipeName: String, ingredients: [String], recipeTime: String, cookTime: String, image: String, recipeDescription: String, recipeDirections: [String], recipeServing: String) {
        self.recipeName = recipeName
        self.ingredients = ingredients
        self.recipeTime = recipeTime
        self.cookTime = cookTime
        self.image = image
        self.recipeDescription = recipeDescription
        self.recipeDirections = recipeDirections
        self.recipeServing = recipeServing
    }
    
}
