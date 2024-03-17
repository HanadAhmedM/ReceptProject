//
//  SearchViewModel.swift
//  ReceptProject
//
//  Created by Abdulrahman.Alazrak on 2024-03-05.
//

import Foundation

// Define a class named SearchViewModel that conforms to ObservableObject
class SearchViewModel: ObservableObject{
    // Published property to hold an array of ReceptBasic objects
    @Published var currentRecepies: [ReceptBasic] = []
    
    // Published property to hold a single ReceptFull object
    @Published var currentRecepie: ReceptFull = ReceptFull()
    
    @Published var changer: String = "" //a text to change so that the view gets updated
    
    // Method to fetch recipes based on provided parameters
    func getRecepies(theItems: [String: String]){
        ApiService.shared.getRecepies(someItems: theItems, completion: { recepies in
            self.currentRecepies = recepies
        })
    }
    
    // Method to fetch a single recipe by its ID
    func getRecepie(theId: Int){
        ApiService.shared.getRecepie(id: theId, completion: { recepie in
            DispatchQueue.main.async{
                self.currentRecepie = recepie
            }
        })
    }
    
    // Method to fetch a single recipe synchronously by its ID
    func getRecepieInCode(theId: Int) -> ReceptFull{
        var receptFull: ReceptFull = ReceptFull()
        ApiService.shared.getRecepie(id: theId, completion: { recepie in
            receptFull = recepie
        })
        return receptFull
    }
}
