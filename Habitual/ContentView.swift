//
//  ContentView.swift
//  Habitual
//
//  Created by Colten Glover on 10/14/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.habits, id: \.id) { habit in
                    HStack {
                        Text(habit.name)
                        Text(habit.consecDays, format: .number)
                    }
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                Button {
                    //Bring up sheet to create new Habit
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
