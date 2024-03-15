//
//  MealPlanPersistence.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-14.
//

import Foundation

import CoreData

// Define a struct named MealPlanPersistence
struct MealPlanPersistence {
    // Singleton instance of MealPlanPersistence
    static let shared = MealPlanPersistence()

    // Core Data persistent container
    let container: NSPersistentContainer

    // Initializer
    init() {
        // Initialize the persistent container with the data model named "MealPlanModel"
        container = NSPersistentContainer(name: "MealPlanModel")

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
