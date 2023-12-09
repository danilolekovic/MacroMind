//
//  DataModel.swift
//  MacroMind
//
//  Created by Danilo Lekovic on 2023-12-08.
//

import Foundation

struct FoodItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var calories: Int
    var protein: Int
    var carbs: Int
    var fats: Int
}

struct DailyIntake: Codable {
    var date: Date
    var totalCalories: Int
    var totalProtein: Int
    var totalCarbs: Int
    var totalFats: Int
    var foodItems: [FoodItem]
}
