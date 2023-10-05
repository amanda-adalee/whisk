//
//  TabBar.swift
//  whisk
//
//  Created by Amanda Arreola on 10/5/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem { 
                    Label("Home", systemImage: "house")
                        }
            
            AddRecipeView()
                .tabItem {
                    Label("New", systemImage: "plus")
                        }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                        }
            
        }
    }
}

#Preview {
    TabBar()
}
