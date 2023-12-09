// ProgressBarWithLabel.swift
// MacroMind

import SwiftUI

struct ProgressBarWithLabel: View {
    var value: Float
    var label: String
    var color: Color

    var body: some View {
        VStack {
            Text(label)
                .font(.subheadline)
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: CGFloat(value) * geometry.size.width, height: 20)
                    .foregroundColor(color)
                    .cornerRadius(45.0)
            }
        }
    }
}
