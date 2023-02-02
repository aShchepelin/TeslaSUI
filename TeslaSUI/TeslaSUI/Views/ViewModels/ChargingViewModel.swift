//
//  ChargingViewModel.swift
//  TeslaSUI
//
//  Created by Александр Андреевич Щепелин on 03.02.2023.
//

import Foundation

/// Вью модель экрана зарядки
final class ChargingViewModel: ObservableObject {
    // MARK: - Publoc Properties
    
    @Published var chargeSliderValue = 0.0
}
