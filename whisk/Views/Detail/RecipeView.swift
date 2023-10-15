//
//  RecipeView.swift
//  whisk
//
//  Created by Amanda Arreola on 10/10/23.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(spacing: -15) {
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .clipped()
                .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                
                VStack(alignment: .center, spacing: 10) {
                    Text(recipe.name)
                        .font(.title2)
                        .bold()
                    
                    if !recipe.description.isEmpty {
                        Text(recipe.description)
                    }
                    
                    HStack {
                        RecipeInfoBox(label: "Category", value: recipe.category.dropFirst().map { $0.rawValue }.joined(separator: ", "))
                        RecipeInfoBox(label: "Servings", value: String(recipe.servings))
                        RecipeInfoBox(label: "Cook Time", value: "\(recipe.cooktime) mins")
                    }.padding(.vertical, 8)
                    
                    VStack(alignment: .leading, spacing: 30) {
                        
                        if !recipe.ingredients.isEmpty {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Ingredients")
                                    .font(.headline)
                                Text(recipe.ingredients)
                            }
                        }
                        
                        if !recipe.directions.isEmpty {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Directions")
                                    .font(.headline)
                                Text(recipe.directions)
                            }
                        }
                        
                    }
                    .frame(maxWidth:.infinity, alignment: .leading)
                }
                .padding()
                .background(
                    RoundedCorners(topLeft: 15, topRight: 15)
                        .fill(Color.white))
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}


#Preview {
    RecipeView(recipe: Recipe.sampleRecipes[0])
}
