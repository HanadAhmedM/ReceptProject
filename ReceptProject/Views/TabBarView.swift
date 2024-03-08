//
//  Tabbar.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-05.
//

import SwiftUI

struct TabBarView: View {
    // Define a structure to represent each tab
    struct Tab {
        let view: AnyView
        let icon: String
        let text: String
    }

    // State variable to keep track of the selected tab
    @State private var selectedTab = 0

    // Array to hold the tabs
    let tabs: [Tab] = [
        Tab(view: AnyView(SearchView()), icon: "magnifyingglass", text: "Search"),
        Tab(view: AnyView(FavoriteRecipesView()), icon: "heart", text: "Favorites"),
        Tab(view: AnyView(MealPlanView()), icon: "calendar", text: "Calendar")
    ]
    
    // Constant range for the ForEach loop
    let tabIndices = Array(0..<3)

    var body: some View {
        // TabView to display the tabs
        TabView(selection: $selectedTab) {
            // Loop through each tab
            ForEach(tabIndices, id: \.self) { index in
                // Display the view associated with the tab
                tabs[index].view
                    // Define tab item with icon and text
                    .tabItem {
                        Image(systemName: tabs[index].icon) 
                        Text(tabs[index].text)
                    }
                    .tag(index)
            }
        }
        .accentColor(Color.green)
    }
}

#Preview {
    TabBarView()
}
