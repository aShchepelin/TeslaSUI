//
//  CarSettingsViewModel.swift
//  SUI
//
//  Created by Александр Андреевич Щепелин on 30.01.2023.
//

import Foundation

/// Вью модель экрана настроек машины
final class CarSettingsViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var isCarClose = false
    @Published var tagSelected = 0
}
