//
//  SearchViewModel.swift
//  ReceptProject
//
//  Created by Abdulrahman.Alazrak on 2024-03-05.
//

import Foundation
class SearchViewModel: ObservableObject{
    @Published var currentRecepies: [ReceptBasic] = []
    @Published var currentRecepie: ReceptFull? = nil
    func getRecepies(theItems: [String: String]){
        ApiService.shared.getRecepies(someItems: theItems, completion: { recepies in
            self.currentRecepies = recepies
        })
    }
    func getRecepie(theId: Int){
        ApiService.shared.getRecepie(id: theId, completion: { recepie in
            self.currentRecepie = recepie
        })
    }
    func getRecepieInCode(theId: Int) -> ReceptFull{
        var receptFull: ReceptFull = ReceptFull()
        ApiService.shared.getRecepie(id: theId, completion: { recepie in
            receptFull = recepie
        })
        return receptFull
    }
}
