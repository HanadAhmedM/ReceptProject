//
//  Tabbar.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-05.
//

import SwiftUI

struct TabBarView: View {

    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(0)

            FavoriteRecipesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
                .tag(1)

            RecipeView()
                         .tabItem {
                             Image(systemName: "calendar")
                             Text("Calendar")
                         }
                         .tag(2)

        }
    }
}

#Preview {
    TabBarView()
}
