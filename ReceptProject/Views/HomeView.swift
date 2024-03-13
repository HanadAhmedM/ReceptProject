//
//  HomeView.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-04.
//

import SwiftUI

struct HomeView: View {
    @State private var isGetStartedActive = false
    @State private var isSignUpActive = false
    
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

                VStack(spacing: 20) {
                    Spacer()
                    
                    NavigationLink(destination: TabBarView(), isActive: $isGetStartedActive) {
                        Text("Get Started")
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 350)
                            .font(.subheadline)
                            .background(isGetStartedActive ? Color.green.opacity(0) : Color.green)
                            .foregroundColor(isGetStartedActive ? .green : .white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.green, lineWidth: 2)
                                    .opacity(isGetStartedActive ? 1 : 0)
                            )
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        isGetStartedActive = true
                    })
                    
                    NavigationLink(destination: TabBarView(), isActive: $isSignUpActive) {
                        Text("Or sign up")
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 350)
                            .font(.subheadline)
                            .background(isSignUpActive ? Color.blue.opacity(0) : Color.blue)
                            .foregroundColor(isSignUpActive ? .blue : .white)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.blue, lineWidth: 2)
                                    .opacity(isSignUpActive ? 1 : 0)
                            )
                    }
                    .padding(.bottom, 80) // Adjust button placement
                    .simultaneousGesture(TapGesture().onEnded {
                        isSignUpActive = true
                    })
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
