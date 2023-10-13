//
//  NewRecipeView.swift
//  whisk
//
//  Created by Amanda Arreola on 10/12/23.
//

import SwiftUI

// TODO: modularize this for code reusability and readability
struct NewRecipeView: View {
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var image: UIImage?
    @State private var ingredients: [String] = []
    @State private var newIngredient: String = ""
    @State private var directions: [String] = []
    @State private var newDirection: String = ""
    @State private var selectedCategory: Category = Category.all
    @State private var servings: Int = 0
    @State private var cooktime: Int = 0
    
    @State private var isImagePickerPresented: Bool = false
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    
    func deleteItem<T>(from array: inout [T], at offsets: IndexSet) {
        array.remove(atOffsets: offsets)
    }

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
                            List {
                                ForEach(ingredients, id: \.self) { ingredient in
                                    Text(ingredient)
                                }
                                .onDelete(perform: { offsets in
                                    deleteItem(from: &ingredients, at: offsets)
                                })
                            }
                    
                    HStack {
                        TextField("add one ingredient at a time", text: $newIngredient)
                        
                        Button("+") {
                            if !newIngredient.isEmpty {
                                ingredients.append(newIngredient)
                                newIngredient = ""
                            }
                        }
                    }
                }
                
                Section(header: Text("Directions")) {
                            List {
                                ForEach(directions, id: \.self) { direction in
                                    Text(direction)
                                }
                                .onDelete(perform: { offsets in
                                    deleteItem(from: &directions, at: offsets)
                                })
                            }
                    
                    HStack {
                        TextField("add one direction at a time", text: $newDirection)
                        
                        Button("+") {
                            if !newDirection.isEmpty {
                                directions.append(newDirection)
                                newDirection = ""
                            }
                        }
                    }
                }
                
                Section(header: Text("Category")) {
                    Picker("pick a category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                                .foregroundColor(.black)
                        }
                    }
                    .pickerStyle(.menu)
                    .foregroundColor(.gray)
                }
                
                Section(header: Text("Servings")) {
                    Stepper("number of servings: \(servings)", value: $servings, in: 0...100)
                        .foregroundColor(.gray)

                }
                
                Section(header: Text("Cook Time")) {
                    Stepper("total cooktime: \(cooktime) mins", value: $cooktime, in: 0...600, step: 5)
                        .foregroundColor(.gray)                }
            }
            
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.dismiss()
                        selectedTab = 0
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
        .accentColor(.black)
        .navigationViewStyle(.stack)
    }
}

#Preview {
    NewRecipeView(selectedTab: .constant(0))
}
