//
//  RecipeModel.swift
//  whisk
//
//  Created by Amanda Arreola on 10/5/23.
//

import Foundation

enum Category: String {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case side = "Side"
    case snack = "Snack"
    case dessert = "Dessert"
    case drink = "Drink"
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    let dataPublished: String
    let url: String
}
