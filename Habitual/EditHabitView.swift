//
//  EditHabitView.swift
//  Habitual
//
//  Created by Colten Glover on 10/23/23.
//

import SwiftUI

struct EditHabitView: View {
    @ObservedObject var habits: Habits
    var habit: Habit
    
    @State var newName = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField(habit.name, text: $newName)
            Button("Submit") {
                let index = habits.habits.firstIndex {$0.id == habit.id}
                habits.habits[index!].name = newName
                dismiss()
            }
        }
    }
}

#Preview {
    var habits = Habits()
    return EditHabitView(habits: habits, habit: habits.habits[0])
}
