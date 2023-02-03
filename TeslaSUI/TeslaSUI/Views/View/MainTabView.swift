// MainTabView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Главный табвью
struct MainTabView: View {
    // MARK: - Public Properties

    var body: some View {
        CustomTabView(selection: $mainTabViewModel.selection) {
            CarSettingsView()
                .myTabItem {
                    TabItem(
                        icon: Constants.Images.carImageName
                    )
                }
                .opacity(mainTabViewModel.selection == 0 ? 1 : 0)
            ChargingView()
                .myTabItem {
                    TabItem(
                        icon: Constants.Images.boltImageName
                    )
                }
                .opacity(mainTabViewModel.selection == 1 ? 1 : 0)
            Color.green
                .myTabItem {
                    TabItem(
                        icon: ""
                    )
                }
                .opacity(mainTabViewModel.selection == 2 ? 1 : 0)
            Text("")
                .myTabItem {
                    TabItem(
                        icon: Constants.Images.mappinImageName
                    )
                }
                .opacity(mainTabViewModel.selection == 3 ? 1 : 0)
            Text("")
                .myTabItem {
                    TabItem(
                        icon: Constants.Images.personImageName
                    )
                }
                .opacity(mainTabViewModel.selection == 4 ? 1 : 0)
        }
        .navigationBarBackButtonHidden()
    }

    // MARK: - Private Properties

    @StateObject private var mainTabViewModel = MainTabViewModel()
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environment(\.colorScheme, .dark)
    }
}
