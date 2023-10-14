//
//  Habit.swift
//  Habitual
//
//  Created by Colten Glover on 10/14/23.
//

import Foundation

struct Habit: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let consecDays: Int
    let dateStarted: Date
}

class Habits: ObservableObject {
    @Published var habits: [Habit]
    init() {
        self.habits = [Habit]()
    }
}
