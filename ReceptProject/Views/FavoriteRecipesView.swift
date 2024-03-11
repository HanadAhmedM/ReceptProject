//
//  FavoriteRecipesView.swift
//  ReceptProject
//
//  Created by Hanad.Ahmed on 2024-03-06.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        HStack(spacing: 10) {
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
                .foregroundColor(Color.red)  // Set the foreground color of the heart to green
                .padding()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(8.0)
        .shadow(radius: 4)
    }
}

struct FavoriteRecipesView: View {
    var body: some View {
        VStack {
            List(0 ..< 5) { _ in
                CardView()
            }
            .listStyle(PlainListStyle()) // Optional: Apply PlainListStyle to remove the default list styling
        }
        .padding() // Optional: Add padding to the VStack containing the list
    }
}

struct FavoriteRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipesView()
    }
}
