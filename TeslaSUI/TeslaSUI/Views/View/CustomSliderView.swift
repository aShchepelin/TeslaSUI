// CustomSliderView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Кастомный слайдер зарядки
struct CustomSliderView: View {
    // MARK: - Public Properties

    @Binding var sliderValue: Double

    var body: some View {
        GeometryReader { proxy in
            let thumbSize = proxy.size.height * 2
            let maxSliderValue = proxy.size.width - thumbSize
            let scaleFactor = maxSliderValue / (
                Constants.Integer.chargeSliderRange.upperBound
                    - Constants.Integer.chargeSliderRange.lowerBound
            )

            let lowerRangeValue = Constants.Integer.chargeSliderRange.lowerBound
            let sliderCurrentValue = (self.sliderValue - lowerRangeValue) * scaleFactor
            let height = proxy.size.height
            ZStack {
                sliderInternalField(height)
                HStack {
                    ProgressViewThumbViewShape()
                        .fill(
                            LinearGradient(
                                colors: [.progressViewTopGradient, .progressViewBottomGradient],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(
                            width: thumbSize,
                            height: thumbSize
                        )
                        .offset(x: sliderCurrentValue)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    if abs(value.translation.width) < 0.1 {
                                        customSliderViewModel.lastCoordinateValue = sliderCurrentValue
                                    }
                                    if value.translation.width > 0 {
                                        let nextCoordinateValue = min(
                                            maxSliderValue,
                                            customSliderViewModel.lastCoordinateValue + value.translation.width
                                        )
                                        self.sliderValue = (
                                            nextCoordinateValue
                                                / scaleFactor
                                        ) + lowerRangeValue
                                    } else {
                                        let nextCoordinateValue = max(
                                            0,
                                            customSliderViewModel.lastCoordinateValue + value.translation.width
                                        )
                                        self.sliderValue = (
                                            nextCoordinateValue
                                                / scaleFactor
                                        ) + lowerRangeValue
                                    }
                                }
                        )
                    Spacer()
                }
            }
        }
    }

    // MARK: - Private Properties

    @StateObject private var customSliderViewModel = CustomSliderViewModel()

    // MARK: - Private Methods

    private func sliderInternalField(_ height: CGFloat) -> some View {
        Capsule()
            .fill(
                LinearGradient(
                    colors: [Color.darkShadow.opacity(0.7), Color.lightShadow],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}
