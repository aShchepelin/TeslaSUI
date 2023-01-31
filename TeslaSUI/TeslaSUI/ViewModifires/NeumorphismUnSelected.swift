//
//  NeumorphismUnSelected.swift
//  SUI
//
//  Created by Александр Андреевич Щепелин on 30.01.2023.
//

import SwiftUI

/// Ненажатая кнопка
struct NeumorphismUnSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.lightShadow
                .opacity(0.25),
                    radius: 6,
                    x: -6,
                    y: -6)
            .shadow(color: Color.darkShadow
                .opacity(0.25),
                    radius: 6,
                    x: 6,
                    y: 6)
    }
}
