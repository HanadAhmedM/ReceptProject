//
//  ReceptProjectApp.swift
//  ReceptProject
//
//  Created by Hanad.Ahmed on 2024-03-04.
//

import SwiftUI

// Define a struct named ReceptProjectApp that conforms to the App protocol.
@main
struct ReceptProjectApp: App {
    // The body property defines the content of the app.
    var body: some Scene {
        // Define a scene for the app.
        WindowGroup {
            // The content of the window group is the HomeView.
           HomeView()
        }
    }
}
