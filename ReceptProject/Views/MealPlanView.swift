//
//  MealPlanView.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-07.
//

import SwiftUI

struct MealPlanView: View {
    let daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

       @State private var selectedDay: String? // Holds the selected day



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

                       ForEach(daysOfWeek, id: \.self) { day in

                           Button(action: {

                               selectedDay = day

                           }) {

                               Text(day)

                                   .foregroundColor(Color.green) // Set the text color to green

                                   .padding()

                                   .background(Color.white) // Set the background color to white

                                   .cornerRadius(10)

                                   .overlay(

                                       RoundedRectangle(cornerRadius: 10) // Rounded Rectangle border

                                           .stroke(Color.green, lineWidth: 2) // Set the border color to green

                                   )

                           }

                       }

                   }

                   .padding()

               }



               // Section for meal planning based on the selected day

               if let day = selectedDay {

                   Text("Plan meals for \(day)")

                       .font(.title)

                       .foregroundColor(Color.green) // Set the text color to green to match the header and buttons

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
