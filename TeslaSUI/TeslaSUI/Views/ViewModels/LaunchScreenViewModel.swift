// LaunchScreenViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель экрана загрузки
final class LaunchScreenViewModel: ObservableObject {
    // MARK: - Public Properties

    @Published var isActive = false
    @Published var progress = 0

    // MARK: - Public Methods

    func launchApp() {
        progress = 1
    }
}
