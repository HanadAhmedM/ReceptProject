//
//  HomeView.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-04.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background image
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 35.0) {
                    Text("Let’s  Cooking")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Delicious and detailed restaurant recipes on your phone")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .baselineOffset(8)
                }
                
                .frame(width: 250.0)
                .multilineTextAlignment(.center)

                VStack {
                    Spacer()
                    
                    NavigationLink(destination: TabBarView()) {
                        Text("Get Started")
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 350)
                            .font(.subheadline)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        
                        
                    }
                    
                    //.padding(.bottom, 80) // Adjust button placement
                    NavigationLink(destination: TabBarView()) {
                        Text("Or sign up")
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 350)
                            .font(.subheadline)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        
                        
                    }
                    .padding(.bottom, 80) // Adjust button placement
                                       

                }
                
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
