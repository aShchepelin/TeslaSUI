// TabItem.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Элемент таббара
struct TabItem: Identifiable, Equatable {
    /// Идентификатор элемента
    var id = UUID()
    /// Иконка элемента
    var icon: String
}
