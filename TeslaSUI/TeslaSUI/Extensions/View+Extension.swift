//
//  View+Extension.swift
//  SUI
//
//  Created by Александр Андреевич Щепелин on 30.01.2023.
//

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
}

/// Модификатор градиента
extension View {
    func animatableGradient(fromGradient: Gradient, toGradient: Gradient, progress: CGFloat) -> some View {
        self.modifier(AnimatableGradientModifier(fromGradient: fromGradient,
                                                 toGradient: toGradient, progress: progress))
    }
}
