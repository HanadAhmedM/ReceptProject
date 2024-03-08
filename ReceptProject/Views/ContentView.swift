//
//  ContentView.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabBarView()
                .navigationBarHidden(true)
        }
    }
}


#Preview {
    ContentView()
}
