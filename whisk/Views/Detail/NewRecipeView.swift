//  Created by Amanda Arreola on 10/12/23.

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
    @State private var selectedCategories: Set<Category> = [.all]
    @State private var servings: Int = 0
    @State private var cooktime: Int = 0
    @State private var isFavorite: Bool = false
    @State private var recipeUrl: String = ""
    
    @State private var isImagePickerPresented: Bool = false
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    
    func deleteItem<T>(from array: inout [T], at offsets: IndexSet) {
        array.remove(atOffsets: offsets)
    }

    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("name")) {
                    TextField("recipe name", text:$name)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(radius: 4, x: 2, y: 2)
                        )
                }
                
                Section(header: Text("description")) {
                    TextField("description of recipe", text:$description)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(radius: 4, x: 2, y: 2)
                        )
                }
                
                Section(header: Text("image")) {
                    if let unwrappedImage = image {
                        Image(uiImage: unwrappedImage)
                            .resizable()
                            .scaledToFit()
                        
                        Button("delete image") {
                            self.image = nil
                        }
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                                .shadow(radius: 4, x: 2, y: 2)
                            
                            Button("tap to add a recipe image") {
                                isImagePickerPresented = true
                            }
                            .foregroundColor(.gray)
                        }
                    }
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(image: $image)
                }

                Section(header: Text("ingredients")) {
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
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .shadow(radius: 4, x: 2, y: 2)
                                )
                        
                        Button("+") {
                            if !newIngredient.isEmpty {
                                ingredients.append(newIngredient)
                                newIngredient = ""
                            }
                        }
                    }
                }
                
                Section(header: Text("directions")) {
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
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(radius: 4, x: 2, y: 2)
                            )
                        
                        Button("+") {
                            if !newDirection.isEmpty {
                                directions.append(newDirection)
                                newDirection = ""
                            }
                        }
                    }
                }
                
                Section(header: Text("category")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(Array(Category.allCases.dropFirst()), id: \.self) { category in
                                Button(action: {
                                    if selectedCategories.contains(category) {
                                        selectedCategories.remove(category)
                                    } else {
                                        selectedCategories.insert(category)
                                    }
                                }) {
                                    
                                    HStack {
                                        if selectedCategories.contains(category) {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.gray)
                                        }
                                        Text(category.rawValue)
                                            .fixedSize()
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedCategories.contains(category) ? Color.black : Color.white)
                                    .foregroundColor(.gray)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                                            )
                                }
                            }
                        }
                    }
                }

                
                Section(header: Text("servings")) {
                    Stepper("number of servings: \(servings)", value: $servings, in: 0...100)
                        .foregroundColor(.gray)

                }
                
                Section(header: Text("cook time")) {
                    Picker("cook time", selection: $cooktime) {
                        ForEach(Array(stride(from: 0, to: 601, by: 5)), id: \.self) { minute in
                            Text("\(minute) mins")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 100)
                    .clipped()
                    .foregroundColor(.gray)
                }
                
                Section(header: Text("favorite")) {
                    Toggle("favorite this recipe", isOn: $isFavorite)
                        .toggleStyle(BlackToggleStyle())
                }
                
                Section(header: Text("url")) {
                    TextField("recipe url", text:$recipeUrl)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(radius: 4, x: 2, y: 2)
                        )
                }
                
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
            
            .background(Color.white)
            .scrollContentBackground(.hidden)
            .navigationTitle("new recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.black)
        .navigationViewStyle(.stack)
    }
}

#Preview {
    NewRecipeView(selectedTab: .constant(0))
}
