//
//  Recept.swift
//  ReceptProject
//
//  Created by Abdulrahman.Alazrak on 2024-03-05.
//

import Foundation

// Struct representing basic information about a recipe
struct ReceptBasic: Codable, Identifiable{
    var id: Int
    var title: String
    var image: String
    var imageType: String
}
