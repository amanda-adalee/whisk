//
//  RecipeCard.swift
//  whisk
//
//  Created by Amanda Arreola on 10/6/23.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)

                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .frame(width: 350, height: 220, alignment: .top)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            
            HStack {
                Text(recipe.name)
                    .font(.title3)
                    .foregroundColor(.primary)
                            
                Spacer()  // Pushes the heart icon to the end
                            
                Button(action: {
                    isFavorite.toggle()}) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .pink : .black)
                            }
                        }
                        .padding([.leading, .trailing, .bottom], 10)
                    }
        }
    }


#Preview {
    RecipeCard(recipe: Recipe.sampleRecipes[0])
}
