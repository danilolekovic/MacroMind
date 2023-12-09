// CalendarView.swift
// MacroMind

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date
    @Binding var goalTracking: [Date: Bool]
    @Binding var dailyIntake: DailyIntake?
    let calendar = Calendar.current

    var body: some View {
        DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
            .onChange(of: selectedDate) { newDate in
                loadDailyGoals(for: newDate)
            }
            .padding()
    }

    func getLastSevenDays() -> [Date] {
        (0..<7).map { dayOffset in
            calendar.date(byAdding: .day, value: -dayOffset, to: selectedDate)!
        }.reversed()
    }
    
    private func loadDailyGoals(for date: Date) {
        dailyIntake = DataManager.shared.loadDailyIntake(for: date)

        // Update goalTracking based on dailyIntake
        if let _ = dailyIntake {
            goalTracking[date] = dailyIntake!.totalCalories <= dailyIntake!.maxCalories
        } else {
            goalTracking[date] = false
        }
    }

}
