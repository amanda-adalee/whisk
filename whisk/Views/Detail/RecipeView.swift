//
//  RecipeView.swift
//  whisk
//
//  Created by Amanda Arreola on 10/10/23.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    @State private var selection: DisplayOption = .ingredients
        
    enum DisplayOption {
        case ingredients, directions }
    
    var body: some View {
        ScrollView {
            VStack(spacing: -15) {
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .clipped()
                .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                
                VStack(alignment: .center, spacing: 10) {
                    Text(recipe.name.lowercased())
                        .font(.title2)
                        .bold()
                    
                    if !recipe.description.isEmpty {
                        Text(recipe.description.lowercased())
                    }
                    
                    HStack {
                        RecipeInfoBox(label: "category", value: recipe.category.dropFirst().map { $0.rawValue }.joined(separator: ", "))
                        RecipeInfoBox(label: "servings", value: String(recipe.servings))
                        RecipeInfoBox(label: "cook time", value: "\(recipe.cooktime) mins")
                    }.padding(.vertical, 8)
                    
                    Picker("Show:", selection: $selection) {
                                            Text("ingredients").tag(DisplayOption.ingredients)
                                            Text("directions").tag(DisplayOption.directions)
                                        }
                                        .pickerStyle(SegmentedPickerStyle())
                                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        switch selection {
                        case .ingredients:
                            if !recipe.ingredients.isEmpty {
                                ForEach(recipe.ingredients, id: \.self) { ingredient in
                                    HStack(alignment: .top) {
                                        Text("•").font(.body)
                                        VStack(alignment: .leading) {
                                            Text(ingredient)
                                        }
                                        Spacer()
                                    }
                                }
                            }
                        
                        case .directions:
                            if !recipe.directions.isEmpty {
                                ForEach(Array(recipe.directions.enumerated()), id: \.offset) { index, direction in
                                    HStack(alignment: .top) {
                                        Text("\(index + 1).").font(.body)
                                        VStack(alignment: .leading) {
                                            Text(direction)
                                        }
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth:.infinity, alignment: .leading)
                }
                .padding()
                .background(
                    RoundedCorners(topLeft: 15, topRight: 15)
                        .fill(Color.white))
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}


#Preview {
    RecipeView(recipe: Recipe.sampleRecipes[0])
}
