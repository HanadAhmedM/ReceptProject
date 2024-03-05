//
//  Tabbar.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-05.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        TabView {
            Text("Flik 1")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.green)
                }
            
            Text("Flik 2")
                .tabItem {
                    Image(systemName: "heart")
                        .foregroundColor(.green)
                }
            
            Text("Flik 3")
                .tabItem {
                    Image(systemName: "calendar")
                        .foregroundColor(.green)
                }
        }
    }
}

#Preview {
    Tabbar()
}
