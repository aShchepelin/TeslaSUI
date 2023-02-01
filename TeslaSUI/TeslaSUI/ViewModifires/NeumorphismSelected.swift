// NeumorphismSelected.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Нажатая кнопка
struct NeumorphismSelected: ViewModifier {
    
    // MARK: - Public Methods

    func body(content: Content) -> some View {
        content
            .shadow(color: Color.lightShadow
                .opacity(0.25),
                    radius: 6,
                    x: 6,
                    y: 6)
            .shadow(color: Color.darkShadow
                .opacity(0.25),
                    radius: 6,
                    x: -6,
                    y: -6)
    }
}
