// DashboardView.swift
// MacroMind

import SwiftUI

struct DashboardView: View {
    @Binding var isAddMacroSheetPresented: Bool
    @Binding var dailyIntake: DailyIntake?

    var body: some View {
        VStack {
            if let intake = dailyIntake {
                let totalCalories = Float(intake.totalCalories)
                let maxCalories = Float(intake.maxCalories)
                let calorieDenominator = totalCalories > maxCalories ? totalCalories : maxCalories
                
                ProgressBarWithLabel(value: totalCalories / calorieDenominator, label: "Calories: \(intake.totalCalories) of \(intake.maxCalories)", color: .green)

                let totalProtein = Float(intake.totalProtein)
                let maxProtein = Float(intake.maxProtein)
                let proteinDenominator = totalProtein > maxProtein ? totalProtein : maxProtein
                
                ProgressBarWithLabel(value: totalProtein / proteinDenominator, label: "Protein: \(intake.totalProtein)g of \(intake.maxProtein)g", color: .orange)
                
                let totalCarbs = Float(intake.totalCarbs)
                let maxCarbs = Float(intake.maxCarbs)
                let carbDenominator = totalCarbs > maxCarbs ? totalCarbs : maxCarbs
                
                ProgressBarWithLabel(value: totalCarbs / carbDenominator, label: "Carbs: \(intake.totalCarbs)g of \(intake.maxCarbs)g", color: .blue)
                
                let totalFats = Float(intake.totalFats)
                let maxFats = Float(intake.maxFats)
                let fatDenominator = totalFats > maxFats ? totalFats : maxFats
                
                ProgressBarWithLabel(value: totalFats / fatDenominator, label: "Fats: \(intake.totalFats)g of \(intake.maxFats)g", color: .red)
            } else {
                Text("No macros recorded for this date")
            }
        }
        .padding()
    }
}

// MARK: - Preview
#if DEBUG
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock instance of DailyIntake
        let sampleIntake = DailyIntake(date: Date(), totalCalories: 1700, totalProtein: 204, totalCarbs: 200, totalFats: 50, foodItems: [], maxCalories: 2300, maxProtein: 210, maxCarbs: 120, maxFats: 60)
        
        // Pass the mock DailyIntake to DashboardView
        DashboardView(isAddMacroSheetPresented: .constant(false), dailyIntake: .constant(sampleIntake))
    }
}
#endif
