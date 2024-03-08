//
//  FavoriteRecipesView.swift
//  ReceptProject
//
//  Created by Hanad.Ahmed on 2024-03-06.
//

import SwiftUI

struct FavoriteRecipesView: View {
    var body: some View {
        //Matilda ska fixa detta, men får vara utkommenterat så länge
       // HStack(spacing: 20) {
               // Image(systemName: "chevron.left.circle")
                    //.foregroundColor(Color.green)
                   // .frame(alignment: .leading)
               // Text("Favorite Recipes")
               // .font(.largeTitle)
                  //  .foregroundColor(.green)
                  //  .frame(alignment: .center)
           // }
        
        VStack{
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                HStack(spacing: 10){
                    Image("1")
                        .resizable()
                        .cornerRadius(25)
                        .frame(width: 100, height: 100)
                    
                    VStack(alignment: .leading) {
                        Text("Lorem Ipsum")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: 0x34A853))
                        
                        Text("Lorem ipsum dolor sit. Ipsum dolor sit.")
                            .font(.caption2)
                            .foregroundColor(Color(hex: 0xBFBFBF))
                            .padding(3.0)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color.green)  // Set the foreground color of the heart to green
                            .padding()
                    }
                    .background(Color(hex: 0xFFFFFF))
              
            }.cornerRadius(8.0)
        }
    }
}

#Preview {
    FavoriteRecipesView()
}
