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
            VStack {
                Text("Favorite Recipe")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(.green)
                    .padding(.top, 25)
                    .multilineTextAlignment(.center)
                    .lineSpacing(6.0)
                
                List(viewModel.recipes, id: \.self) { recipe in
                    // Encapsulate each item in a VStack and HStack
                    HStack {
                        AsyncImage(url: URL(string: recipe.image ?? ""), scale: 2.5)
                            .cornerRadius(10)
                        
                        VStack(){
                        HStack (){
                            HStack {
                                Spacer().frame(width: 25)
                                Text(recipe.title ?? "Lorem Ipsum")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundStyle(.green)
                                     Spacer()
                            }
                        
                            Button(action: {
                                viewModel.deleteFavorite(recipe: recipe)
                                                                   
                                }){
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Color.red)
                                    .padding()
                                                              
                            }
                                .padding(.trailing, -10)
                            
                        }
                            
                        }
                    }
                    .frame(width: 300, height: 100, alignment: .leading)
                }
            }
    
    
            
        }
    }

struct FavotireRecipesView_Previews: PreviewProvider {
static var previews: some View {
    FavoriteRecipesView()
}
}
