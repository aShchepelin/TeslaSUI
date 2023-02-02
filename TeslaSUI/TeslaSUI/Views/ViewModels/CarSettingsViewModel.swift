// CarSettingsViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Вью модель экрана настроек машины
final class CarSettingsViewModel: ObservableObject {
    // MARK: - Public Properties

    @Published var isCarClose = false
    @Published var tagSelected = 0
    @Published var isNavigationTapped = false
}
