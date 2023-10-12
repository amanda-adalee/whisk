//
//  NewRecipeView.swift
//  whisk
//
//  Created by Amanda Arreola on 10/12/23.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var name: String = ""
    @State private var image: UIImage?
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var selectedCategory: Category = Category.all
    @State private var servings: String = ""
    @State private var cooktime: String = ""
    
    @State private var isImagePickerPresented: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Name")) {
                    TextField("recipe name", text:$name)
                }
                
                Section(header: Text("Description")) {
                    TextField("recipe description", text:$description)
                }
                
                Section(header: Text("Image")) {
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                    }
                    Button("click to add a recipe image") {
                        isImagePickerPresented = true
                    }
                    .foregroundColor(.gray)
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(image: $image)
                }
                
                Section(header: Text("Ingredients")) {
                    TextField("add one ingredient at a time", text:$ingredients)
                }
                
                Section(header: Text("Directions")) {
                    TextField("add one direction at a time", text:$directions)
                }
                
                Section(header: Text("Category")) {
                    Picker("pick a category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue.capitalized)
                                .tag(category)
                                .foregroundColor(.black)
                        }
                    }
                    .pickerStyle(.menu)
                    .foregroundColor(.gray)
                }
                
                Section(header: Text("Servings")) {
                    TextField("how many servings is this recipe for", text:$servings)
                }
                
                Section(header: Text("Cook Time")) {
                    TextField("total cook time for recipe", text:$cooktime)
                }
            }
            
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                ToolbarItem{
                    Button {
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(name.isEmpty)
                }
            })
            
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    NewRecipeView()
}
