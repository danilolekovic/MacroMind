//
//  DataManager.swift
//  MacroMind
//
//  Created by Danilo Lekovic on 2023-12-08.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private let defaults = UserDefaults.standard

    // Save data
    func saveDailyIntake(_ intake: DailyIntake) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(intake) {
            defaults.set(encoded, forKey: intake.date.formattedDate())
        }
    }
    
    // Load data for a specific date
    func loadDailyIntake(for date: Date) -> DailyIntake? {
        if let savedData = defaults.data(forKey: date.formattedDate()) {
            let decoder = JSONDecoder()
            if let loadedIntake = try? decoder.decode(DailyIntake.self, from: savedData) {
                return loadedIntake
            }
        }
        return nil
    }
}

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
