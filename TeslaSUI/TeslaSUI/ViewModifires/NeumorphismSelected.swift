//
//  NeumorphismSelected.swift
//  SUI
//
//  Created by Александр Андреевич Щепелин on 30.01.2023.
//

import SwiftUI

/// Нажатая кнопка
struct NeumorphismSelected: ViewModifier {
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
