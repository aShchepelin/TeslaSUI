//
//  BottomSheetViewModel.swift
//  TeslaSUI
//
//  Created by Александр Андреевич Щепелин on 01.02.2023.
//

import SwiftUI

/// Вью модель боттомшита
final class BottomSheetViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var currentMenuOffsetY: CGFloat = 0.0
    @Published var lastMenuOffsetY: CGFloat = 0.0
    
    // MARK: - Public Methods
    
    func getOffsetY() {
        let maxHeight = UIScreen.main.bounds.height / 6
        
        withAnimation {
            if -currentMenuOffsetY > maxHeight / 2 {
                currentMenuOffsetY = -maxHeight
            } else {
                currentMenuOffsetY = 0
            }
            lastMenuOffsetY = currentMenuOffsetY
        }
    }
}
