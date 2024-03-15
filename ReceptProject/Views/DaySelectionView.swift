//
//  DaySelectionView.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-15.
//

import SwiftUI

// DaySelectionView.swift

struct DaySelectionView: View {
    @Binding var selectedDate: Date
    let onCancel: () -> Void
    let onSave: () -> Void
    
    // Dina val för veckodagar
    let daysOfWeek = ["Måndag", "Tisdag", "Onsdag", "Torsdag", "Fredag", "Lördag", "Söndag"]
    
    var body: some View {
        VStack {
            // Picker för att välja en dag från listan av veckodagar
            Picker("Välj dag", selection: $selectedDate) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                }
            }
            .pickerStyle(WheelPickerStyle()) // Använd WheelPickerStyle för en visuell Picker
            
            HStack {
                Button("Avbryt") {
                    onCancel()
                }
                .padding()
                Button("Spara") {
                    onSave()
                }
            }
            .padding()
        }
        .padding()
        .cornerRadius(20)
        .shadow(radius: 2)
    }
}


struct DaySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DaySelectionView(selectedDate: .constant(Date()), onCancel: {}, onSave: {})
    }
}

