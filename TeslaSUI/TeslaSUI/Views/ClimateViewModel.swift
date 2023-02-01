//
//  ClimateViewModel.swift
//  TeslaSUI
//
//  Created by Александр Андреевич Щепелин on 31.01.2023.
//

import SwiftUI

/// Вью модель экрана климат контроля
final class ClimateViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var circleProgress = 0.0
    @Published var sliderValue = 0.0
    @Published var settings = false
    @Published var acParameters = 0.0
    @Published var isAcButtonTapped = false
    @Published var heatParameters = 0.0
    @Published var fanParameters = 0.0
    @Published var autoParameters = 0.0
    @Published var minTemprature = 15
    @Published var color = Color.blue
    @Published var isPowerButtonSelected = false
    @Published var isAlertShown = false
}
