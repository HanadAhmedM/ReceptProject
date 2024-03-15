//
//  SearchView.swift
//  ReceptProject
//
//  Created by Hanad.Ahmed on 2024-03-04.
//

import SwiftUI

struct SearchView: View {
    // State variable to store the search key
    @State var searchingKey: String = ""
        var body: some View {
            VStack(spacing: 20) {
                // Title text
                       Text("Let’s cook something delicious")
                    .font(.largeTitle)
                           .foregroundColor(.green)
                         
                // Search bar
                       HStack {
                           // Text field for searching
                           TextField("Search recipe...", text: $searchingKey)
                               .padding(.horizontal)
                               .background(Color.white)
                               .foregroundColor(Color(hex: 0xBFBFBF))
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                           
                           // Search button
                           Image(systemName: "line.horizontal.3.decrease.circle")
                               .resizable()
                               .frame(width: 20, height: 20)
                               .foregroundColor(.white)
                               .padding()
                               .background(Color.green)
                               .cornerRadius(8.0)
                       }
                
                // Recipe list
                VStack{
                    List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        // Recipe item view
                        HStack(spacing: 10){
                            // Recipe image
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
                            
                            // Favorite button
                            Image(systemName: "heart.fill")
                                    .foregroundColor(Color.green)  // Set the foreground color of the heart to green
                                    .padding()
                            }
                            .background(Color(hex: 0xFFFFFF))
                      
                    }.cornerRadius(8.0)
                }
                
                         
            }.background(Color(hex: 0xFFFFFF))
        }
                  
               }
           

           struct DestinationView: View {
               var body: some View {
                   Text("This is the Destination View")
                       .navigationTitle("Destination")
               }
           }

           extension Color {
               // Initialize color with hex value
               init(hex: UInt, alpha: Double = 1.0) {
                   self.init(
                       .sRGB,
                       red: Double((hex >> 16) & 0xff) / 255,
                       green: Double((hex >> 8) & 0xff) / 255,
                       blue: Double(hex & 0xff) / 255,
                       opacity: alpha
                   )
               }
           }

    #Preview {
        SearchView()
    }
