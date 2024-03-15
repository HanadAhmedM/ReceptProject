//
//  MealPlanViewModel.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-14.
//


import Foundation
import CoreData

// Define a class named MealPlanViewModel that conforms to ObservableObject
class MealPlanViewModel: ObservableObject {
    
    // Published property to hold an array of Meal objects
    @Published var recipes: [Meal] = []
    // Reference to the persistent container from the MealPlanPersistence singleton
    var container = MealPlanPersistence.shared.container
    
    // Initializer
    init() {
        // Fetch meal plan upon initialization
        self.fetchMealPlan()
    }
    
    // Method to fetch meal plan from Core Data
    func fetchMealPlan() {
        let request = NSFetchRequest<Meal>(entityName: "Meal")

        do {
            // Fetch meals from Core Data
            recipes = try container.viewContext.fetch(request)
            print("Fetch successful. Number of Meals: \(recipes.count)")
        } catch let error as NSError {
            print("Error fetching meals: \(error.localizedDescription)")
        }
    }
   
    // Method to add a recipe to meal plan
    func addRecipe(id: Int, title: String, image: String) {
        // Check if the meal already exists
        if recipes.first(where: { $0.id == Int32(id) }) != nil {
            print("Meal already exists. Do not add.")
            return
        }
        
        // Create a new Meal object and populate its properties
        let newRecipe = Meal(context: container.viewContext)
        newRecipe.id = Int32(id)
        newRecipe.title = title
        newRecipe.image = image
      
        // Save the changes to Core Data
        saveData()
        fetchMealPlan()  // Refresh the meals array
    }
    
    // Method to delete a meal plan recipe
    func deleteMealPlan(recipe: Meal) {
        container.viewContext.delete(recipe)
        saveData()
    }
    
    // Method to save changes to Core Data
    func saveData() {
        do {
           try container.viewContext.save()
        } catch let error {
            print("Error saving data: \(error)")
        }
        // Refresh the meals array
        fetchMealPlan()
    }
    
}
