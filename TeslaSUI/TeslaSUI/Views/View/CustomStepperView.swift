// CustomStepperView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Кастомный степпер
struct CustomStepperView: View {
    // MARK: - Public properties

    @Binding var value: Int

    var body: some View {
        HStack {
            Button {
                value -= 1
            } label: {
                Image(systemName: Constants.Images.chevronLeftImageName)
            }
            Text("\(15 + value)\(Constants.Text.celsiusText)")
                .font(.system(size: 34))
                .padding(.horizontal)
            Button {
                value += 1
            } label: {
                Image(systemName: Constants.Images.chevronRightImageName)
            }
        }
        .frame(width: 300, alignment: .center)
        .foregroundColor(.white)
    }
}
