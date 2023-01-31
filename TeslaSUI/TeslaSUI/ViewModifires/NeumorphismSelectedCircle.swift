//
//  NeumorphismUnSelectedCircle.swift
//  SUI
//
//  Created by Александр Андреевич Щепелин on 30.01.2023.
//

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
