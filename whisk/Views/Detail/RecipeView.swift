//
//  RecipeView.swift
//  whisk
//
//  Created by Amanda Arreola on 10/10/23.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
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
                    Text(recipe.name)
                        .font(.title2)
                        .bold()
                    
                    if !recipe.description.isEmpty {
                        Text(recipe.description)
                    }
                    
                    VStack(alignment: .leading, spacing: 30) {
                        
                        if !recipe.ingredients.isEmpty {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Ingredients")
                                    .font(.headline)
                                Text(recipe.ingredients)
                            }
                        }
                        
                        if !recipe.directions.isEmpty {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Directions")
                                    .font(.headline)
                                Text(recipe.directions)
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

struct RoundedCorners: Shape {
    var topLeft: CGFloat = 0
    var topRight: CGFloat = 0
    var bottomLeft: CGFloat = 0
    var bottomRight: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.size.width
        let height = rect.size.height
        
        path.move(to: CGPoint(x: width / 2.0, y: 0))
        path.addLine(to: CGPoint(x: width - topRight, y: 0))
        path.addArc(center: CGPoint(x: width - topRight, y: topRight), radius: topRight, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: width, y: height - bottomRight))
        path.addArc(center: CGPoint(x: width - bottomRight, y: height - bottomRight), radius: bottomRight, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bottomLeft, y: height))
        path.addArc(center: CGPoint(x: bottomLeft, y: height - bottomLeft), radius: bottomLeft, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: topLeft))
        path.addArc(center: CGPoint(x: topLeft, y: topLeft), radius: topLeft, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return path
    }
}

#Preview {
    RecipeView(recipe: Recipe.sampleRecipes[0])
}
