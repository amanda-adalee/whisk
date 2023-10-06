//
//  RecipeList.swift
//  whisk
//
//  Created by Amanda Arreola on 10/6/23.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]
    
    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes": "recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 15)], spacing: 15) {
                ForEach(recipes) { recipe in
                    RecipeCard(recipe: recipe)
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ScrollView{
        RecipeList(recipes: Recipe.all)
    }
}
