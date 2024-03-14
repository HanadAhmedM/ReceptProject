//
//  MealPlanPersistence.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-14.
//

import Foundation

import CoreData

struct MealPlanPersistence {
    static let shared = MealPlanPersistence()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MealPlanModel")

        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack with error: \(error)")
                
            } else {
                print("Core Data stack loaded successfully")
            }
        }
    }
}
