//
//  Habit.swift
//  Habitual
//
//  Created by Colten Glover on 10/14/23.
//

import Foundation

struct Habit: Codable, Identifiable {
    var id = UUID()
    var name: String
    let description: String
    let consecDays: Int
    let dateStarted: Date
}

class Habits: ObservableObject {
    @Published var habits = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "habits")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "habits") {
            if let loaded = try? JSONDecoder().decode([Habit].self, from: data) {
                self.habits = loaded
                return
            }
        }
        
        self.habits = [Habit]()
    }
}
