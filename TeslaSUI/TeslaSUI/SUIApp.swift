// SUIApp.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

@main
struct SUIApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
                .environment(\.colorScheme, .dark)
        }
    }
}
