//
//  MealPlanViewModel.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-14.
//


import Foundation
import CoreData

class MealPlanViewModel: ObservableObject {
   
    @Published var recipes: [Meal] = []
    var container = MealPlanPersistence.shared.container
    
    init() {
        self.fetchMealPlan()
    }
    
    func fetchMealPlan() {
        let request = NSFetchRequest<Meal>(entityName: "Meal")

        do {
            recipes = try container.viewContext.fetch(request)
            print("Fetch successful. Number of Meals: \(recipes.count)")
        } catch let error as NSError {
            print("Error fetching meals: \(error.localizedDescription)")
        }
    }
   
    func addRecipe(id: Int, title: String, image: String) {
        if recipes.first(where: { $0.id == Int32(id) }) != nil {
            print("Meal already exists. Do not add.")
            return
        }
        let newRecipe = Meal(context: container.viewContext)
        newRecipe.id = Int32(id)
        newRecipe.title = title
        newRecipe.image = image
      
        saveData()
        fetchMealPlan()  // Refresh the meals array
    }
    
    func deleteMealPlan(recipe: Meal) {
        container.viewContext.delete(recipe)
        saveData()
    }
    
    func saveData() {
        do {
           try container.viewContext.save()
        } catch let error {
            print("Error saving data: \(error)")
        }
        fetchMealPlan()
    }
    
}
