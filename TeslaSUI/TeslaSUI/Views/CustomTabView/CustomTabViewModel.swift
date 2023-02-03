// CustomTabViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель кастомного табвью
final class CustomTabViewModel: ObservableObject {
    // MARK: - Public Properties

    @Published var tabs: [TabItem] = []
}
