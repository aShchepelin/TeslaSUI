// View+Extension.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Выбор модификатора с тенями
extension View {
    func neumorphismUnSelectedStyle() -> some View {
        modifier(NeumorphismUnSelected())
    }

    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }

    func neumorphismUnSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnSelectedCircle())
    }

    func neumorphismSelectedCircleStyle() -> some View {
        modifier(NeumorphismSelectedCircle())
    }

    func neumorhismNavigationCircleButtonUnselected() -> some View {
        modifier(NeumorhismNavigationCircleButtonUnselected())
    }

    func myTabItem(_ label: () -> TabItem) -> some View {
        modifier(TabItemModifire(tabBatItem: label()))
    }
}

/// Модификатор градиента
extension View {
    func animatableGradient(fromGradient: Gradient, toGradient: Gradient, progress: CGFloat) -> some View {
        modifier(AnimatableGradientModifier(
            fromGradient: fromGradient,
            toGradient: toGradient,
            progress: progress
        ))
    }
}
