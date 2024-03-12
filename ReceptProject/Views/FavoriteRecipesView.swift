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
        
                VStack {
                    List(0 ..< 5) { item in
                        // Encapsulate each item in a VStack and HStack
                        VStack {
                            HStack {
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
                                    .foregroundColor(Color.red) // Set the foreground color of the heart to green
                                    .padding()
                            }
                            .padding(10) // Add padding around each card
                            .background(Color.white) // Set background color for each card
                            .cornerRadius(8.0) // Add corner radius to make it look like a card
                            .shadow(radius: 4) // Add shadow to make it stand out
                        }
                    }
                    .listStyle(PlainListStyle())
                }
        
        
                
            }
        }

struct FavotireRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipesView()
    }
}
