//
//  FavoritesView.swift
//  whisk
//
//  Created by Amanda Arreola on 10/5/23.
//

import SwiftUI

// TODO: this list is not updating when a recipe is favorited in the home view, need to fix
struct FavoritesView: View {
    @State private var selectedCategory = Category.all
    @State private var searchTerm = ""
    
    var filteredRecipes: [Recipe] {
        var results = Recipe.sampleRecipes
        
        // favorite filter
        results = results.filter { $0.isFavorite == true }
        
        // category filter
        if selectedCategory != .all {
            results = results.filter { $0.category.contains(selectedCategory) }
        }
        
        // search term filter
        if !searchTerm.isEmpty {
            results = results.filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
        }
        
        return results
    }
    
    var body: some View {
        NavigationView {
            ScrollView{
                
                CustomCategoryPicker(selectedCategory: $selectedCategory)

                RecipeList(recipes: filteredRecipes)
            
            }
            .navigationTitle("my favorite recipes")
            .searchable(text: $searchTerm, prompt: "search favorite recipes")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    FavoritesView()
}
