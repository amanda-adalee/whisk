//  Created by Amanda Arreola on 10/12/23.

import SwiftUI

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
                
                TextInput(title: "name", text: $name)
                TextInput(title: "description", text: $description)
                
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

                ListInput(headerTitle: "ingredients", items: $ingredients, newItem: $newIngredient)
                ListInput(headerTitle: "directions", items: $directions, newItem: $newDirection)
                CategoryInput(categories: Array(Category.allCases.dropFirst()), selectedCategories: $selectedCategories)
                ServingsInput(servings: $servings)
                CookTimeInput(cooktime: $cooktime)
                FavoriteInput(isFavorite: $isFavorite)
                TextInput(title: "url", text: $recipeUrl)
                
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
