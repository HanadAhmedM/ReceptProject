//
//  MealPlanView.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-07.
//

import SwiftUI

struct MealPlanView: View {
    let dateFormatter = DateFormatter()
    let dayFormatter = DateFormatter()

    @State private var selectedDay: String? // Holds the selected day

    init() {
        // Initialize date and day formatters
        dateFormatter.dateFormat = "d" // Set the date format to display day of the month
        dayFormatter.dateFormat = "E" // Set the date format to get the short weekday string
    }

    var body: some View {
        VStack {
            Text("Meal Plan")
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(.green)
                .padding(.top, 25)
                .multilineTextAlignment(.center)
                .lineSpacing(6.0)
            HStack {
            // Horizontal ScrollView for days of the week buttons
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) { // Added spacing between buttons
                    ForEach(0..<7) { index in
                        if let dayDate = Calendar.current.date(byAdding: .day, value: index, to: Date()) {
                            let day = dayFormatter.string(from: dayDate)
                            let date = dateFormatter.string(from: dayDate)
                            Button(action: {
                                selectedDay = day
                            }) {
                                VStack {
                                    Text(day)
                                        .foregroundColor(Color.green)
                                        .font(.system(size: 18, weight: .bold))
                                    Text(date)
                                        .foregroundColor(Color.green)
                                        .background(Color.white)
                                        .font(.system(size: 18, weight: .bold))
                                        .frame(width: 70, height: 50)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(Color.green, lineWidth: 2)
                                        )
                                }
                            }
                        }
                    }
                }
                .padding()
            }
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
