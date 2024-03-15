//
//  SignInView.swift
//  ReceptProject
//
//  Created by Christofer Karlsson on 2024-03-15.
//

import SwiftUI

struct SignInView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Sign in")
                        .font(.largeTitle)
                        .foregroundColor(.black.opacity(0.50))
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    HStack {
                        Text("Forgot password?")
                            .foregroundColor(.black.opacity(0.40))
                            .padding(35)
                            
                        
                        Button("Login") {
                            
                        }
                        .buttonStyle(.bordered)
                        .tint(.blue)
                        .padding(35)
                        .font(.title3)
                        
                    }
                    
                    HStack {
                    
                        Button {
                            
                        } label: {
                            Label("Sign in with Apple", systemImage: "applelogo")
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
                        
                        
                    }
                    
                    Text("New here? Register now!")
                        .font(.system(size: 12))
                        .foregroundColor(.black.opacity(0.70))
                }
                
            }
            .navigationBarHidden(true)
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
