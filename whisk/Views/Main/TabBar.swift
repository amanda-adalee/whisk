//  Created by Amanda Arreola on 10/5/23.

import SwiftUI

struct TabBar: View {
    @State private var selectedTab: Int = 0
    @State private var showNewRecipeView: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("home", systemImage: "house")
                }
                .tag(0)
            
            Text("New")
                .tabItem {
                    Label("new", systemImage: "plus")
                }
                .tag(1)
            
            FavoritesView()
                .tabItem {
                    Label("favorites", systemImage: "heart")
                }
                .tag(2)
        }
        .onChange(of: selectedTab) { newValue in
            if newValue == 1 {
                showNewRecipeView = true
                // reset tab to home
                selectedTab = 0
            }
        }
        .sheet(isPresented: $showNewRecipeView) {
            NewRecipeView(selectedTab: $selectedTab)
        }
        .accentColor(.black)
    }
}

#Preview {
    TabBar()
}
