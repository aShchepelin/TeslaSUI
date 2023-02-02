// TabItemPreferenceKey.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Помогите придумать название
struct TabItemPreferenceKey: PreferenceKey {
    // MARK: - Public Properties

    static var defaultValue: [TabItem] = []

    // MARK: - Public Methods

    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
    }
}
