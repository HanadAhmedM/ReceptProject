//
//  ReceptFull.swift
//  ReceptProject
//
//  Created by Abdulrahman.Alazrak on 2024-03-05.
//

import Foundation
struct Ingredient{
    var id: Int = 0
    var name: String = ""
    var localizedName: String = ""
    var image: String = ""
}
struct Equipment{
    var id: Int = 0
    var name: String = ""
    var localizedName: String = ""
    var image: String = ""
}
struct Step{
    var number: Int = 0
    var step: String = ""
    var ingredients: [Ingredient] = []
    var equipment: [Equipment] = []
}
struct AnalyzedInstruction{
    var name: String = ""
    var steps: [Step] = []
}
struct ReceptFull{
    var id: Int = 0
    var title: String = ""
    var image: String = ""
    var imageType: String = ""
    var servings: Int = 0
    var preparationMinutes: Int = 0
    var cookingMinutes: Int = 0
    var aggregateLikes: Int = 0
    var readyInMinutes: Int = 0
    
    var license: String = ""
    var sourceName: String = ""
    var sourceUrl: String = ""
    var spoonacularSourceUrl: String = ""
    var healthScore: Double = 0.0
    var spoonacularScore: Double = 0.0
    var pricePerServing: Double = 0.0
    var analyzedInstructions: [AnalyzedInstruction] = []
    var cheap: Bool = false
    var creditsText: String = ""
    var cuisines: [String] = []
    var dairyFree: Bool = false
    var diets: [String] = []
    var gaps: String = ""
    var glutenFree: Bool = false
    var instructions: String = ""
    var ketogenic: Bool = false
    var lowFodmap: Bool = false
    var occasions: [String] = []
    var sustainble: Bool = false
    var vegetarian: Bool = false
    var vegan: Bool = false
    var veryHealthy: Bool = false
    var veryPopular: Bool = false
    var whole30: Bool = false
    var weightWatcherSmartPoints: Int = 0
    var dishTypes: [String] = []
    var extendedIngredients: [extendedIngredient] = []
    var summary: String = ""
    
}

struct extendedIngredient{
    var aisle: String = ""
    var amount: Double = 0.0
    var consistency: String = ""
    var name: String = ""
    var nameClean: String = ""
    var original: String = ""
    var originalName: String = ""
    var unit: String = ""
    var meta: [String] = []
    var measures: Measures?
}
struct Measures{
    var us: Measure?
    var metric: Measure?
}
struct Measure: Decodable{
    var amount: Double = 0.0
    var unitShort: String = ""
    var unitLong: String = ""
}
