// NeumorphismUnSelectedCircle.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Ненажатая круглая кнопка
struct NeumorphismUnSelectedCircle: ViewModifier {
    
    // MARK: - Public Methods

    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(
                Circle()
                    .fill(Color.backgrounElement)
            )
            .neumorphismUnSelectedStyle()
            
    }
}
