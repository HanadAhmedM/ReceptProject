//
//  RecipeView.swift
//  ReceptProject
//
//  Created by Hanad.Ahmed on 2024-03-05.
//

import SwiftUI

struct RecipeView: View {
    var body: some View {
        VStack{
               HStack(spacing: 20) {
                       Image(systemName: "chevron.left.circle")
                           .foregroundColor(Color.green)
                           .frame(alignment: .leading)
                       Text("Recipe")
                       .font(.largeTitle)
                           .foregroundColor(.green)
                           .frame(alignment: .center)
                   
                   }
               VStack(spacing: 10){
                   Image("1")
                       .resizable()
                       .cornerRadius(25)
                       .frame(width: 430,height: 291)
                   Text("Ice Cream").bold()
                       .font(.title)
                       .foregroundColor(Color.green)
                     //  .frame(alignment: .leadingFirstTextBaseline)
                   Text("Dolor sit ipsum, dolor sit ipsum  ipsum dolor sit. Ipsum dolor sit.  ipsum dolor sit. Ipsum dolor sit.  ipsum dolor sit. Ipsum dolor sit.").foregroundColor(.secondary)
                       .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                   
                   
                  
                       }
               Text("Ingredients").font(.title2)    .font(.title2)
                   .foregroundColor(Color.green)
                   .frame(maxWidth: .infinity, alignment: .leading)
               List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                   HStack{
                       
                            Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color.green)  // Set the foreground color of the heart to green
                                 
                        Text("Dolor sit ipsum").foregroundColor(.secondary)
                   }
                
                  
                } .listStyle(PlainListStyle())
               }
           }
       
          
           }

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
