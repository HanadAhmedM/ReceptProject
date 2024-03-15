//
//  DaySelectionView.swift
//  ReceptProject
//
//  Created by Matilda Lindahl on 2024-03-15.
//

import SwiftUI


struct DaySelectionView: View {
    @Binding var selectedDate: Date
    let onCancel: () -> Void
    let onSave: () -> Void
    
    let daysOfWeek = ["Måndag", "Tisdag", "Onsdag", "Torsdag", "Fredag", "Lördag", "Söndag"]
    
    var body: some View {
        
        
        VStack {
            Text("Select Day For Your Meal Plan")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.green)
                .multilineTextAlignment(.center)
                .lineSpacing(6.0)
            
            Picker("Select Day", selection: $selectedDate) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            HStack {
                Button("Cancel") {
                    onCancel()
                }
                .foregroundColor(.green)
                .padding()
                .font(.system(size: 20, weight: .bold))

                Spacer()
                
                Button("Save") {
                    onSave()
                }
                .foregroundColor(.green)
                .padding()
                .font(.system(size: 20, weight: .bold))

            }
            .padding()
        }
        .padding()
        .cornerRadius(20)
    }
}


struct DaySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DaySelectionView(selectedDate: .constant(Date()), onCancel: {}, onSave: {})
    }
}

