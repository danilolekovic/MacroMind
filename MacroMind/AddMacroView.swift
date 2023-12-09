// AddMacroView.swift
// MacroMind

import SwiftUI

struct AddMacroView: View {
    @State private var foodName: String = ""
    @State private var calories: String = ""
    @State private var protein: String = ""
    @State private var carbs: String = ""
    @State private var fats: String = ""
    @State private var servingSize: String = ""

    private func addFoodItem() {
        let foodItem = FoodItem(name: foodName, calories: Int(calories) ?? 0, protein: Int(protein) ?? 0, carbs: Int(carbs) ?? 0, fats: Int(fats) ?? 0)
        
        // Retrieve current intake or create a new one
        var dailyIntake = DataManager.shared.loadDailyIntake(for: Date()) ?? DailyIntake(date: Date(), totalCalories: 0, totalProtein: 0, totalCarbs: 0, totalFats: 0, foodItems: [])
        
        // Update daily intake
        dailyIntake.foodItems.append(foodItem)
        dailyIntake.totalCalories += foodItem.calories
        dailyIntake.totalProtein += foodItem.protein
        dailyIntake.totalCarbs += foodItem.carbs
        dailyIntake.totalFats += foodItem.fats
        
        // Save updated intake
        DataManager.shared.saveDailyIntake(dailyIntake)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Food Details")) {
                    TextField("Food Name", text: $foodName)
                    TextField("Calories", text: $calories)
                    TextField("Protein (g)", text: $protein)
                    TextField("Carbs (g)", text: $carbs)
                    TextField("Fats (g)", text: $fats)
                    TextField("Serving Size", text: $servingSize)
                }
                // Add a submit button or similar action
                Button("Add", action: addFoodItem)
            }
            .navigationBarTitle("Add Macros", displayMode: .inline)
        }
    }
}

struct AddMacroView_Previews: PreviewProvider {
    static var previews: some View {
        AddMacroView()
    }
}
