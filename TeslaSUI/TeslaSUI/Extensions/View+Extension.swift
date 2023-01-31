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
}
