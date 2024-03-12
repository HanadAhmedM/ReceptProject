//
//  Persistence.swift
//  ReceptProject
//
//  Created by Hanad.Ahmed on 2024-03-12.
//

import Foundation

import CoreData

struct Persistence {
    static let shared = Persistence()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "FavoriteRecipeModel")

        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack with error: \(error)")
            } else {
                print("Core Data stack loaded successfully")
            }
        }
    }
}
