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
    
    @State private var navigateToRecipe: Bool = false
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
                ImageInput(image: $image)
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
                    NavigationLink(isActive: $navigateToRecipe){
                        RecipeView(recipe: Recipe.sampleRecipes.sorted{ $0.datePublished > $1.datePublished}[0])
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Button {
                            navigateToRecipe = true
                        } label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
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
