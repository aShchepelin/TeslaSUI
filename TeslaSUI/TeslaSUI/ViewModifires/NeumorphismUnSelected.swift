// NeumorphismUnSelected.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Не нажатая кнопка
struct NeumorphismUnSelected: ViewModifier {
    
    // MARK: - Public Methods

    func body(content: Content) -> some View {
        content
            .shadow(color: Color.lightShadow,
                    radius: 6,
                    x: -6,
                    y: -6)
            .shadow(color: Color.darkShadow,
                    radius: 6,
                    x: 6,
                    y: 6)
    }
}
