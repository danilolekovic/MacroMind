// ContentView.swift
// MacroMind

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    @State private var isAddMacroSheetPresented = false
    @State private var goalTracking: [Date: Bool] = [:]
    @State private var dailyIntake: DailyIntake?

    var body: some View {
        NavigationView {
            VStack {
                CalendarView(selectedDate: $selectedDate, goalTracking: $goalTracking, dailyIntake: $dailyIntake)
                DashboardView(isAddMacroSheetPresented: $isAddMacroSheetPresented, dailyIntake: $dailyIntake)
                Button("Add Macros") {
                    isAddMacroSheetPresented = true
                }
                .sheet(isPresented: $isAddMacroSheetPresented) {
                    AddMacroView(selectedDate: $selectedDate)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                Spacer()
            }
            .navigationBarTitle("MacroMind", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
