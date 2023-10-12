//
//  AddRecipeView.swift
//  whisk
//
//  Created by Amanda Arreola on 10/5/23.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var showAddRecipe = false
    
    var body: some View {
        NavigationView {
            Button("Add New Recipe Manually"){
                showAddRecipe = true
            }
                .navigationTitle("Add Recipe")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe) {
            NewRecipeView()
        }
    }
}

#Preview {
    AddRecipeView()
}
