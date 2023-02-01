// NeumorphismSelectedCircle.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Ненажатая круглая кнопка
struct NeumorphismSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(
                Circle()
                    .fill(Color.backgrounElement)
            )
            .neumorphismSelectedStyle()
            
    }
}
