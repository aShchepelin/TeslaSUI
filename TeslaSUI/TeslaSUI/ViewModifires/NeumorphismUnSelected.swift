// NeumorphismUnSelected.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Ненажатая кнопка
struct NeumorphismUnSelected: ViewModifier {
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
