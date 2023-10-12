//
//  TabBar.swift
//  whisk
//
//  Created by Amanda Arreola on 10/5/23.
//

import SwiftUI

struct TabBar: View {
    @State private var showNewRecipe = false
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem { 
                    Label("Home", systemImage: "house")
                        }
            
            Button("Enter new recipe manually") {
                showNewRecipe = true
            }
            .tabItem {
                Label("New", systemImage: "plus")
            }
            .sheet(isPresented: $showNewRecipe) {
                NewRecipeView()
            }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                        }
        }
        .accentColor(.black)
    }
}

#Preview {
    TabBar()
}
