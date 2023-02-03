// StartViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Вью модель стартового экрана
final class StartViewModel: ObservableObject {
    // MARK: - Public Properties

    @Published var isOpenButtonTapped = false
    @Published var isCarSettingsViewShown = false
}
