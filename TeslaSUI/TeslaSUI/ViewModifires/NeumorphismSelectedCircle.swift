// NeumorphismSelectedCircle.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Не нажатая круглая кнопка
struct NeumorphismSelectedCircle: ViewModifier {
    // MARK: - Public Methods

    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(
                Circle()
                    .fill(Color.backgroundElement)
            )
            .neumorphismSelectedStyle()
    }
}
