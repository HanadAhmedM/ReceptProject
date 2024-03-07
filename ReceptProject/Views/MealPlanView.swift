//
//  MealPlanView.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-07.
//

import SwiftUI

struct MealPlanView: View {
    let dateFormatter = DateFormatter()
    @State private var selectedDay: String? // Holds the selected day
    
    init() {
        // Initialize dateFormatter to format dates
        dateFormatter.dateFormat = "E" // Set the date format to "E" for getting the short weekday string
    }

    var body: some View {
        VStack {
            // Header with back button and title
            HStack {
                Button(action: {
                    // Action for back navigation
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .foregroundColor(Color.green)
                }
                Spacer()
                Text("Meal Plan")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                Spacer()
            }
            .padding()
            
            // Horizontal ScrollView for days of the week buttons
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<7) { index in
                        if let day = Calendar.current.date(byAdding: .day, value: index, to: Date()) {
                            let weekday = dateFormatter.string(from: day)
                            Button(action: {
                                selectedDay = weekday
                            }) {
                                Text(weekday)
                                    .foregroundColor(Color.green)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.green, lineWidth: 2)
                                    )
                            }
                        }
                    }
                }
                .padding()
            }
            
            // Section for meal planning based on the selected day
            if let day = selectedDay {
                Text("Plan meals for \(day)")
                    .font(.title)
                    .foregroundColor(Color.green)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}




#Preview {
    MealPlanView()
}
