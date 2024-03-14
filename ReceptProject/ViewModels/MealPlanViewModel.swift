//
//  MealPlanViewModel.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-14.
//


import Foundation
import CoreData
class MealPlanViewModel : ObservableObject{
   
    @Published var recipes: [Recept] = []
    var container = Persistence.shared.container
    init(){
        self.fetchMealPlan()
    }
    func fetchMealPlan() {
        let request = NSFetchRequest<Recept>(entityName: "Recept")

        do {
            recipes = try container.viewContext.fetch(request)
            print("Fetch successful. Number of Recipe: \(recipes.count)")
        } catch let error as NSError {
            print("Error fetching notes: \(error.localizedDescription)")
            
        }
    }
   
    func addRecipe(id : Int,title : String,image: String){
        if recipes.first(where: { $0.id == Int32(id) }) != nil {
                   print("Recipe already exists. Do not add.")
                   return
               }
        let newRecipe = Recept(context: container.viewContext)
        newRecipe.id = Int32(id)
        newRecipe.title = title
        newRecipe.image = image
       
      
        saveData()
        fetchMealPlan()  // Refresh the recipes array
    }
    func deleteMealPlan(recipe: Recept){
        container.viewContext.delete(recipe)
            saveData()
    }
    func saveData(){
        do {
           try container.viewContext.save()
        } catch let error{
            print("error adding person \(error)")
        }
        fetchMealPlan()
    }
    
}
