//
//  AddHabitView.swift
//  Habitual
//
//  Created by Colten Glover on 10/14/23.
//

import SwiftUI

struct AddHabitView: View {
    @State private var habitName = ""
    @State private var habitDesc = ""
    @State private var dateStarted = Date()
    
    @ObservedObject var habits: Habits
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Habit Name") {
                TextField("Habit name here", text: $habitName)
            }
            
            Section("Habit Description") {
                TextField("Habit description here", text: $habitDesc)
            }
            
            Section("Date Started") {
                DatePicker("", selection: $dateStarted, displayedComponents: .date)
                    .labelsHidden()
            }
            
            Button("Add New Habit") {
                let habit = Habit(name: habitName, description: habitDesc, consecDays: 0, dateStarted: dateStarted)
                habits.habits.append(habit)
                dismiss()
            }
        }
    }
}

#Preview {
    var habits = Habits()
    return AddHabitView(habits: habits)
}
