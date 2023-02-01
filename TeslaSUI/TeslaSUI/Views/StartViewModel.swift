//
//  StartViewModel.swift
//  SUI
//
//  Created by Александр Андреевич Щепелин on 31.01.2023.
//

import Foundation

/// Вью модель стартового экрана
final class StartViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var isOpenButtonTapped = false
    @Published var isCarSettingsViewShown = false
}
