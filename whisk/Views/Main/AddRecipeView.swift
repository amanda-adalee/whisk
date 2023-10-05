//
//  AddRecipeView.swift
//  whisk
//
//  Created by Amanda Arreola on 10/5/23.
//

import SwiftUI

struct AddRecipeView: View {
    var body: some View {
        NavigationView {
            Text("Add New Recipe")
                .navigationTitle("Add Recipe")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    AddRecipeView()
}
