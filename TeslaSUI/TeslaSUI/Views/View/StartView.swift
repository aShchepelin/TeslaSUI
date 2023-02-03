// StartView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Стартовый экран приложения
struct StartView: View {
    // MARK: - Public Properties

    var body: some View {
        NavigationView {
            backgroundStackView {
                VStack {
                    settingsButton
                        .padding(.leading, 300)
                    Spacer()
                    welcomeTextView
                    Spacer()
                    teslaImageView
                        .animation(
                            startViewModel.isOpenButtonTapped ? .easeInOut(duration: 2.5) : .easeIn(duration: 2.5),
                            value: startViewModel.isOpenButtonTapped
                        )
                    Spacer()
                    closeCarControllView
                }
            }
        }
    }

    // MARK: - Private Proprties

    @StateObject private var startViewModel = StartViewModel()

    private var welcomeTextView: some View {
        VStack {
            if startViewModel.isOpenButtonTapped {
                Text(Constants.Text.hiText)
                Text(Constants.Text.welcomeText)
                    .font(.largeTitle)
                    .bold()
                    .opacity(startViewModel.isOpenButtonTapped ? 1 : 0)
                    .transition(.opacity)
            } else {
                EmptyView()
            }
        }
    }

    private var closeCarControllView: some View {
        Button {
            withAnimation {
                startViewModel.isOpenButtonTapped.toggle()
            }
        } label: {
            HStack {
                Label {
                    Text(startViewModel.isOpenButtonTapped ? Constants.Text.closedText : Constants.Text.openText)
                        .foregroundColor(.white)
                } icon: {
                    Image(
                        systemName: startViewModel.isOpenButtonTapped ? Constants.Images.lockOpenImageName
                            : Constants.Images.lockClosedImageName
                    )
                    .renderingMode(.template)
                    .neumorphismUnSelectedCircleStyle()
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.backgroundElement)
                    .neumorphismSelectedStyle()
            )
        }
        .frame(width: 300)
    }

    private var settingsButton: some View {
        NavigationLink(isActive: $startViewModel.isCarSettingsViewShown) {
            MainTabView()
        } label: {
            Image(Constants.Images.gearshapeImageName)
                .neumorhismNavigationCircleButtonUnselected()
        }
    }

    private var teslaImageView: some View {
        Image(
            startViewModel.isOpenButtonTapped ? Constants.Images.teslaUnlockedImageName :
                Constants.Images.teslaLockedImageName
        )
        .resizable()
        .scaledToFit()
        .frame(
            width: startViewModel.isOpenButtonTapped ? 407 : 382.5,
            height: startViewModel.isOpenButtonTapped ? 330 : 255
        )
        .padding(.bottom, startViewModel.isOpenButtonTapped ? 0 : 55)
    }

    // MARK: - Private Methods

    private func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            if startViewModel.isOpenButtonTapped {
                Rectangle()
                    .fill(LinearGradient(
                        colors: [Color.secondScreenTopGradient, Color.secondScreenBottomGradient],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                    .edgesIgnoringSafeArea(.all)
                    .animation(.easeInOut, value: startViewModel.isOpenButtonTapped)
                content()
            } else {
                Rectangle()
                    .fill(LinearGradient(
                        colors: [
                            Color.topBackgroundGradient,
                            Color.black,
                            Color.black,
                            Color.bottomBackgroundGradient
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                    .edgesIgnoringSafeArea(.all)
                    .animation(.easeIn, value: startViewModel.isOpenButtonTapped)
                content()
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environment(\.colorScheme, .dark)
    }
}
