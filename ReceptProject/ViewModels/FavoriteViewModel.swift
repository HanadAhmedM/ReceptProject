//
//  FavoriteViewModel.swift
//  ReceptProject
//
//  Created by Hanad.Ahmed on 2024-03-12.
//

import Foundation
import CoreData
class FavoriteViewModel : ObservableObject{
   
    @Published var recipes: [Recept] = []
    var container = Persistence.shared.container
    init(){
        self.fetchFavorite()
    }
    func fetchFavorite() {
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
            fetchFavorite()  // Refresh the recipes array
    }
    func deleteFavorite(recipe: Recept){
        container.viewContext.delete(recipe)
            saveData()
    }
    func saveData(){
        do {
           try container.viewContext.save()
        } catch let error{
            print("error adding person \(error)")
        }
        fetchFavorite()
    }
    
}
