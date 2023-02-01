// ButtonImageModifire.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Модифаер картинки в кнопках
struct ButtonImageModifire: ViewModifier {
    
    // MARK: - Public Methods
    
    func body(content: Content) -> some View {
             content
            .scaledToFit()
            .frame(width: 50, height: 50)
            .foregroundColor(.gray)
         }
}
