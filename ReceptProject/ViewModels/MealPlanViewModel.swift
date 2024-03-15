//
//  MealPlanViewModel.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-14.
//


import Foundation
import CoreData

class MealPlanViewModel: ObservableObject {
   
    @Published var recipes: [Meal] = [] // Ändrade namnet på variabeln från recipes till meals
    var container = MealPlanPersistence.shared.container // Använder MealPlanPersistence-strukturen
    
    init() {
        self.fetchMealPlan()
    }
    
    func fetchMealPlan() {
        let request = NSFetchRequest<Meal>(entityName: "Meal") // Ändrade från Recept till Meal

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
        let newRecipe = Meal(context: container.viewContext) // Ändrade från Recept till Meal
        newRecipe.id = Int32(id)
        newRecipe.title = title
        newRecipe.image = image
      
        saveData()
        fetchMealPlan()  // Refresh the meals array
    }
    
    func deleteMealPlan(recipe: Meal) { // Ändrade namnet på parameter från recipe till meal
        container.viewContext.delete(recipe) // Ändrade från Recept till Meal
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
