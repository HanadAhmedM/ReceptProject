//
//  FavoriteRecipesView.swift
//  ReceptProject
//
//  Created by Hanad.Ahmed on 2024-03-06.
//

import SwiftUI

struct FavoriteRecipesView: View {
    @StateObject var viewModel = FavoriteViewModel()
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
                    List(viewModel.recipes, id: \.self) { recipe in
                        // Encapsulate each item in a VStack and HStack
                        VStack {
                            HStack (spacing: 10)
                            {
                                AsyncImage(url: URL(string: recipe.image ?? ""), scale: 2)
                                    
                                    .cornerRadius(25)
                                    .frame(width: 100, height: 100)
                                 
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text(recipe.title ?? "Lorem Ipsum")
                                        .font(.subheadline)
                                        .foregroundColor(Color(hex: 0x34A853))
                                    
                                 
                                }
                                
                                Spacer()
                              
                                Button(action: {
                                    viewModel.deleteFavorite(recipe: recipe)
                                                                       
                                                                   }){
                                                                       Image(systemName: "xmark.circle.fill")
                                                                           .foregroundColor(Color.red) // Set the foreground color of the heart to green
                                                                           .padding()
                                                                   }
                                
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
