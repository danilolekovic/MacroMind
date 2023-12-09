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
    @State private var servingsEaten: String = ""
    @Binding public var selectedDate: Date

    private func addFoodItem() {
        let foodItem = FoodItem(name: foodName, calories: Int(calories) ?? 0, protein: Int(protein) ?? 0, carbs: Int(carbs) ?? 0, fats: Int(fats) ?? 0)
        
        // Retrieve current intake or create a new one
        // ToDo: Pull up defaults for maxes
        var dailyIntake = DataManager.shared.loadDailyIntake(for: selectedDate) ?? DailyIntake(date: selectedDate, totalCalories: 0, totalProtein: 0, totalCarbs: 0, totalFats: 0, foodItems: [], maxCalories: 2300, maxProtein: 210, maxCarbs: 120, maxFats: 60)
        
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
            VStack {
                Form {
                    Section(header: Text("Food Details")
                        .foregroundColor(.black)) {
                        TextField("Food Name", text: $foodName)
                            .foregroundColor(.black)
                        TextField("Calories", text: $calories)
                            .foregroundColor(.black)
                        TextField("Protein (g)", text: $protein)
                            .foregroundColor(.black)
                        TextField("Carbs (g)", text: $carbs)
                            .foregroundColor(.black)
                        TextField("Fats (g)", text: $fats)
                            .foregroundColor(.black)
                    }
                    Section(header: Text("Serving Details")
                        .foregroundColor(.black)) {
                        TextField("Serving Size (g / mL)", text: $servingSize)
                            .foregroundColor(.black)
                        TextField("Servings Eaten (#)", text: $servingsEaten)
                            .foregroundColor(.black)
                    }
                }
                .navigationBarTitle("Add Macros", displayMode: .inline)
                
                Button("Save Macros", action: addFoodItem)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding()
            }
        }
    }
}

struct AddMacroView_Previews: PreviewProvider {
    static var previews: some View {
        AddMacroView(selectedDate: .constant(Date()))
    }
}
