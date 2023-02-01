// NeumorhismNavigationCircleButtonUnselected.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Ненажатая кнопка навигации
struct NeumorhismNavigationCircleButtonUnselected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 40,
                   height: 40)
            .padding()
            .background(RoundedRectangle(cornerRadius: 50)
            .fill(
                LinearGradient(colors: [.lightShadow, .darkShadow],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            ))
            .overlay {
                Circle()
                    .stroke(
                        LinearGradient(colors: [.darkShadow, .lightShadow.opacity(0.2)],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing), lineWidth: 2
                    )
            }
            .neumorphismUnSelectedStyle()
    }
}
