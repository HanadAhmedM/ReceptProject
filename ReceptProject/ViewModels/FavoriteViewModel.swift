//
//  FavoriteViewModel.swift
//  ReceptProject
//
//  Created by Hanad.Ahmed on 2024-03-12.
//

import Foundation
import CoreData

// Define a class named FavoriteViewModel that conforms to ObservableObject
class FavoriteViewModel : ObservableObject{
    
    // Published property to hold an array of Recept objects
    @Published var recipes: [Recept] = []
    
    // Reference to the persistent container from the Persistence singleton
    var container = Persistence.shared.container
    
    // Initializer
    init(){
        // Fetch favorites upon initialization
        self.fetchFavorite()
    }
    
    // Method to fetch favorite recipes from Core Data
    func fetchFavorite() {
        let request = NSFetchRequest<Recept>(entityName: "Recept")

        do {
            // Fetch recipes from Core Data
            recipes = try container.viewContext.fetch(request)
            print("Fetch successful. Number of Recipe: \(recipes.count)")
        } catch let error as NSError {
            print("Error fetching notes: \(error.localizedDescription)")
            
        }
    }
   
    // Method to add a recipe to favorites
    func addRecipe(id : Int,title : String,image: String){
        // Check if the recipe already exists
        if recipes.first(where: { $0.id == Int32(id) }) != nil {
                   print("Recipe already exists. Do not add.")
                   return
               }
        
        // Create a new Recept object and populate its properties
        let newRecipe = Recept(context: container.viewContext)
        newRecipe.id = Int32(id)
        newRecipe.title = title
        newRecipe.image = image
       
        // Save the changes to Core Data
        saveData()
            fetchFavorite()  // Refresh the recipes array
    }
    
    // Method to delete a favorite recipe
    func deleteFavorite(recipe: Recept){
        container.viewContext.delete(recipe)
        
        // Save the changes to Core Data
            saveData()
    }
    
    // Method to save changes to Core Data
    func saveData(){
        do {
           try container.viewContext.save()
        } catch let error{
            print("error adding person \(error)")
        }
        // Refresh the recipes array
        fetchFavorite()
    }
    
}
