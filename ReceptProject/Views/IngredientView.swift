//
//  IngredientView.swift
//  ReceptProject
//
//  Created by Abdulrahman.Alazrak on 2024-03-16.
//

import SwiftUI

struct IngredientView: View {
    var ingredient: extendedIngredient
    var body: some View {
        VStack(alignment: .leading, spacing: 3){
            HStack{
                Text(ingredient.name)
                    .font(.title)
                    .padding(.leading, 10)
                Spacer()
                AsyncImage(url: URL(string: "https://spoonacular.com/cdn/ingredients_100x100/".appending(ingredient.image)))
                    .border(width: 3, edges: [.leading], color: .yellow)
            }
            .background(.green)
            HStack{
                Spacer()
                Text(ingredient.original)
                    .padding()
                    .font(.title3)
                Spacer()
            }
            .background(.yellow)

        }
        .background(.yellow)
        .border(width: 3, edges: [.top, .bottom, .trailing, .leading], color: .black)
    }
}

#Preview {
    IngredientView(ingredient: extendedIngredient(aisle: "", amount: 0.0, consistency: "", image: "butter-sliced.jpg", id: 0, name: "butter", nameClean: "", original: "2 tbsp fr fr", originalName: "", unit: "", meta: [], measures: Measures(us: Measure(amount: 0.0, unitShort: "", unitLong: ""), metric: Measure(amount: 0.0, unitShort: "", unitLong: ""))))
}
