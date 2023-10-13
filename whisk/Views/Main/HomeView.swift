//
//  HomeView.swift
//  whisk
//
//  Created by Amanda Arreola on 10/5/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCategory = Category.all
    @State private var searchTerm = ""
    
    var filteredRecipes: [Recipe] {
        var results = Recipe.sampleRecipes
        
        // Category filter
        if selectedCategory != .all {
            results = results.filter { $0.category.contains(selectedCategory) }
        }
        
        // Search term filter
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
            .navigationTitle("My Recipes")
            .searchable(text: $searchTerm, prompt: "search recipes")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    HomeView()
}
