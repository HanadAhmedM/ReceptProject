//
//  Persistence.swift
//  ReceptProject
//
//  Created by Hanad.Ahmed on 2024-03-12.
//

import Foundation

import CoreData

// Define a struct named Persistence
struct Persistence {
    
    // Singleton instance of Persistence
    static let shared = Persistence()
    
    // Core Data persistent container
    let container: NSPersistentContainer
    
    // Initializer to set up the Core Data stack
    init() {
        // Initialize the persistent container with the data model named "FavoriteRecipeModel"
        container = NSPersistentContainer(name: "FavoriteRecipeModel")
        
        // Load persistent stores
        container.loadPersistentStores { (description, error) in
            if let error = error {
                // If there's an error loading the persistent store, terminate the app
                fatalError("Failed to load Core Data stack with error: \(error)")
                
            } else {
                // If persistent stores load successfully, print a success message
                print("Core Data stack loaded successfully")
            }
        }
    }
}
