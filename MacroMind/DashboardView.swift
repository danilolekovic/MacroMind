// DashboardView.swift
// MacroMind

import SwiftUI

struct DashboardView: View {
    @Binding var isAddMacroSheetPresented: Bool
    @Binding var dailyIntake: DailyIntake?

    var body: some View {
        VStack {
            if let intake = dailyIntake {
                ProgressBarWithLabel(value: Float(intake.totalCalories) / 2000, label: "Calories: \(intake.totalCalories)/2000", color: .green)
                // Repeat for protein, carbs, and fats
            } else {
                Text("No data for selected date")
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock instance of DailyIntake
        let sampleIntake = DailyIntake(date: Date(), totalCalories: 1500, totalProtein: 100, totalCarbs: 200, totalFats: 50, foodItems: [])
        
        // Pass the mock DailyIntake to DashboardView
        DashboardView(isAddMacroSheetPresented: .constant(false), dailyIntake: .constant(sampleIntake))
    }
}
#endif
