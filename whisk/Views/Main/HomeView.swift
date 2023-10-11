//
//  HomeView.swift
//  whisk
//
//  Created by Amanda Arreola on 10/5/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCategory = Category.all
    
    var filteredRecipes: [Recipe] {
        if selectedCategory == .all {
            return Recipe.sampleRecipes
        }
        return Recipe.sampleRecipes.filter { $0.category.contains(selectedCategory) }
    }
    
    var body: some View {
        NavigationView {
            ScrollView{
                Picker("Category", selection: $selectedCategory) {
                    ForEach(Category.allCases, id: \.self) { category in
                        Text(category.rawValue.capitalized)
                            .tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

                RecipeList(recipes: filteredRecipes)
            
            }
            .navigationTitle("My Recipes")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    HomeView()
}
