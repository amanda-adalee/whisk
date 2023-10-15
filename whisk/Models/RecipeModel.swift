//
//  RecipeModel.swift
//  whisk
//
//  Created by Amanda Arreola on 10/5/23.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Equatable, Identifiable {
    case all, breakfast, lunch, dinner, side, snack, dessert, drink
    
    var id: String { self.rawValue }
}

class Recipe: Identifiable, ObservableObject {
    let id: UUID
    let name: String
    let image: String
    let description: String
    let ingredients: Array<String>
    let directions: Array<String>
    let category: [Category]
    let servings: Int
    let cooktime: Int
    let dataPublished: String
    @Published var isFavorite: Bool
    let recipeUrl: String
    
    init(id: UUID, name: String, image: String, description: String, ingredients: Array<String>, directions: Array<String>, category: [Category], servings: Int, cooktime: Int, dataPublished: String, isFavorite: Bool, recipeUrl: String) {
        self.id = id
        self.name = name
        self.image = image
        self.description = description
        self.ingredients = ingredients
        self.directions = directions
        self.category = category
        self.servings = servings
        self.cooktime = cooktime
        self.dataPublished = dataPublished
        self.isFavorite = isFavorite
        self.recipeUrl = recipeUrl
    }

    static let sampleRecipes: [Recipe] = [
        Recipe(
            id: UUID(),
            name: "Chocolate Chip Cookies",
            image: "https://www.foodandwine.com/thmb/IODo3eyFDVqu4W9xVprpPhEE2mM=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Chocolate-Chunk-Halwah-Cookies-FT-RECIPE0923-1f8df755df6d468da98887aa846a2fe3.jpg",
            description: "Grandma's recipe for the yummiest cookies ever.",
            ingredients: ["1 cup butter","3/4 cup of brown sugar","2 eggs","1 tsp vanilla","1 tsp salt","1 tsp baking soda","2 1/2 cups of flour"],
            directions: ["Prep: Preheat the oven to 350 degrees Fahrenheit. Line a baking sheet with parchment paper.","Cream: In a medium bowl, and using a mixer on medium, cream together the butter, brown sugar, and granulated sugar.","Beat: Add the eggs and vanilla extract, and beat until fluffy.", "Mix: Add the all-purpose flour, baking soda, baking powder, and salt, and mix until combined. Add the chocolate chips, and mix well.","Scoop and Bake: Using a 1-inch cookie scoop, drop the dough onto the prepared baking sheet. Bake for 7 or 8 minutes per batch.","Cool: Transfer the cookies to a wire rack to cool."],
            category: [.all, .dessert],
            servings: 12,
            cooktime: 60,
            dataPublished: "2023-10-06",
            isFavorite: true,
            recipeUrl: "https://www.foodandwine.com/chocolate-chunk-cookies-7642670"),
        Recipe(
            id: UUID(),
            name: "Strawberry Milkshake",
            image: "https://www.happinessishomemade.net/wp-content/uploads/2021/05/Two-Strawberry-Milkshakes-in-Glass-Cups.jpg",
            description: "This strawberry milkshake is thick, creamy, and everything that you would hope a milkshake would be! Made with delicious strawberries, this classic dessert is sure to be loved by all!",
            ingredients: ["3 cups Vanilla Ice Cream","1/2 cup Frozen Sliced Strawberries, sweetened (mostly thawed)","1/2 cup Milk","1/4 cup Whipped Topping"],
            directions: ["Combine: Place the scoops of vanilla ice cream in a blender. Pour in the milk and sweetened strawberries.","Blend: Blend on high until the ingredients are smooth and incorporated.","Serve: Top with whipped topping and enjoy!"],
            category: [.all,.breakfast],
            servings: 2,
            cooktime: 15,
            dataPublished: "2023-10-06",
            isFavorite: false,
            recipeUrl: "https://therecipecritic.com/strawberry-milkshake/"),
        Recipe(
            id: UUID(),
            name: "Chia Pudding",
            image: "https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2020/01/How-To-Make-Chia-Pudding-4.jpg",
            description: "This 3-Ingredient Chia Pudding is made with almond milk, chia seeds & sweetener of choice; it's a healthy snack loaded with protein, fiber and healthy fats!",
            ingredients: ["2 tablespoon chia seeds","2 cup almond milk or milk of choice","1 teaspoon honey or other sweetener, optional","Strawberries or other fruits for topping"],
            directions: ["Pour ingredients into a jar and mix well. Let settle for 2-3 minutes then mix again very well until you see no clumping.","Cover the jar and store in fridge overnight or for at least 2 hours.","When you’re ready to eat it, top with your favorite fruit and enjoy cold!"],
            category: [.all,.snack, .breakfast],
            servings: 2,
            cooktime: 180,
            dataPublished: "2023-10-06",
            isFavorite: true,
            recipeUrl: "https://feelgoodfoodie.net/recipe/3-ingredient-chia-pudding/"),
        Recipe(
            id: UUID(),
            name: "Baked Feta Pasta",
            image: "https://insanelygoodrecipes.com/wp-content/uploads/2022/05/Homemade-Tiktok-Feta-Pasta.webp",
            description: "With over 1 billion (yes, billion) views, this viral TikTok feta pasta is one of the world’s most successful food trends.",
            ingredients: ["1 pound of penne pasta","1/2 cup of olive oil","2 pints of cherry tomatoes","1 8 oz block of feta cheese","1 tablespoon of italian seasoning","2 pinches of red pepper flakes"],
            directions: ["Preheat the oven to 400 degrees Fahrenheit. To a baking dish, add tomatoes, olive oil, and salt; toss to coat.","Place the feta in the center of the dish and drizzle with more olive oil. Sprinkle red pepper flakes on top.","Bake for 30 minutes. Increase the heat to 450 degrees Fahrenheit and bake for 5-10 more minutes, or until the feta has browned and the tomatoes have blistered.","While baking, cook the pasta according to package instructions. Drain the noodles but save some pasta water for the sauce (about 1 cup).","Once cooked, take the baking dish out of the oven and stir in the garlic and basil. The residual heat will warm the garlic and take out its raw edge.","Toss in the pasta. Add pasta water if the sauce is too dry. Season with salt and pepper. Serve and enjoy!"],
            category: [.all,.dinner],
            servings: 6,
            cooktime: 60,
            dataPublished: "2023-10-06",
            isFavorite: false,
            recipeUrl: "https://insanelygoodrecipes.com/tiktok-feta-pasta/"),
        Recipe(
            id: UUID(),
            name: "Cheesy Baked Potatoes",
            image: "https://www.dinneratthezoo.com/wp-content/uploads/2021/04/oven-baked-potatoes-7.jpg",
            description: "These oven baked potatoes are perfectly cooked with a crispy outside and fluffy interiors. The perfect simple and inexpensive side dish that can be customized with any number of toppings, and pairs perfectly with chicken, beef and seafood.",
            ingredients: ["4 Russet potatoes approximately 6-8 ounces each","2 tablespoons olive oil","kosher salt to taste","toppings such as butter, sour cream, cheese and bacon"],
            directions: ["Preheat the oven to 425 degrees F. Coat a sheet pan with cooking spray.","Scrub the potatoes under cold running water. Prick the potatoes all over with a fork or paring knife.","Place the potatoes on the sheet pan. Brush the olive oil all over the potatoes, then season the potatoes generously with salt.","Place the pan in the oven. Bake for 45-60 minutes or until skins are crisp and insides are tender.","Let potatoes cool for 5 minutes. Cut a slit down the center of each potato and pull the sides back. Fluff the insides of the potatoes with a fork.","Add toppings as desired, then serve."],
            category: [.all,.side,.dinner],
            servings: 6,
            cooktime: 90,
            dataPublished: "2023-10-06",
            isFavorite: true,
            recipeUrl: "https://www.dinneratthezoo.com/oven-baked-potatoes/"),

    ]
}

