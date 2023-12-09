//  DataModel.swift
//  MacroMind

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
    var maxCalories: Int
    var maxProtein: Int
    var maxCarbs: Int
    var maxFats: Int
}

struct UserPersonalization : Codable {
    var age: Int
    
    // Weight is in pounds
    var weight: Double
    
    // Height is in inches
    var height: Double
    
    // calorieMax is the number of calories the user can have per day
    // This should be stored in calendar entries
    var calorieMax: Int
}
