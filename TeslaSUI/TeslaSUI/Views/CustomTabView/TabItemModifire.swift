// TabItemModifire.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Модификатор элемента таббара
struct TabItemModifire: ViewModifier {
    // MARK: - Public Properties

    let tabBatItem: TabItem

    // MARK: - Pubcic Methods

    func body(content: Content) -> some View {
        content
            .preference(key: TabItemPreferenceKey.self, value: [tabBatItem])
    }
}
