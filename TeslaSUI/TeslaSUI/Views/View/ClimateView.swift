// ClimateView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Экран настроек климат контроля
struct ClimateView: View {
    // MARK: - Public Propeties

    var body: some View {
        backgroundStackView {
            ZStack {
                VStack {
                    headerView
                    ZStack {
                        progressView
                        trimCirlceProgressView
                        if climateViewModel.isAlertShown {
                            alertView
                        } else {
                            EmptyView()
                        }
                    }
                    Spacer()
                    climateSettingsView
                    Spacer()
                }
                bottomSheetView
            }
        }
    }

    // MARK: Private Propeties

    @Environment(\.presentationMode) private var presentation

    @StateObject private var climateViewModel = ClimateViewModel()

    private var bottomSheetView: some View {
        BottomSheetView {
            VStack {
                bottomSheetCapsuleView
                Spacer()
                HStack {
                    bottomSheetTextView
                    Spacer()
                    acIsOnButtonView
                }
                .padding(.horizontal)
                HStack(spacing: -20) {
                    colorPickerView
                    stepperView
                    ventButtonView
                }
                .padding(.top)
                Spacer(minLength: 240)
            }
        }
    }

    private var headerView: some View {
        HStack {
            backButtonView
            Spacer()
            screenNameTextView
            Spacer()
            settingsButtonView
        }
    }

    private var gradient: LinearGradient {
        LinearGradient(
            colors: [.topGradient, .bottomGradient],
            startPoint: .bottom,
            endPoint: .top
        )
    }

    private var alertView: some View {
        VStack {
            if let url = URL(string: Constants.Text.teslaSupportLink) {
                Link(destination: url) {
                    Image(systemName: Constants.Images.linkImageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                Button(Constants.Text.closeButtonLabelText) {
                    withAnimation(.linear) {
                        climateViewModel.isAlertShown.toggle()
                    }
                }
                .foregroundColor(.white)
            }
        }
        .background(
            Circle()
                .fill(Color.backgroundElement)
                .frame(width: 100, height: 100)
        )
    }

    private var colorPickerView: some View {
        VStack {
            ColorPicker("", selection: $climateViewModel.color)
        }
        .frame(width: 45)
        .padding(.top, -10)
    }

    private var stepperView: some View {
        CustomStepperView(
            value: Binding(
                get: {
                    Int(climateViewModel.circleProgress)
                },
                set: { newValue in
                    climateViewModel.getStepperValue(newValue)
                }
            )
        )
    }

    private var ventButtonView: some View {
        VStack {
            Button {} label: {
                Image(Constants.Images.carDoorImageName)
                    .resizable()
                    .frame(width: 21, height: 22)
                    .foregroundColor(.gray)
            }
            Text(Constants.Text.ventText)
                .offset(y: 30)
        }
    }

    private var acIsOnButtonView: some View {
        Button {
            climateViewModel.isPowerButtonSelected.toggle()
        } label: {
            Image(Constants.Images.powerIconImageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(
                    width: 20,
                    height: 20
                )
                .padding(25)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(
                            LinearGradient(
                                colors: [.topGradient, .bottomGradient],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                )
                .overlay {
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [.topGradient, .bottomGradient],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ), lineWidth: 2
                        )
                }
                .neumorphismUnSelectedStyle()
        }
        .padding([.top, .leading], -20)
    }

    private var bottomSheetCapsuleView: some View {
        Capsule()
            .fill(.gray)
            .frame(width: 80, height: 3)
            .padding(.top)
    }

    private var bottomSheetTextView: some View {
        VStack(alignment: .leading) {
            Text(Constants.Text.acIsOnText)
                .font(.system(size: 20, weight: .semibold))
            Text(Constants.Text.turnOnButtonText)
                .font(.system(size: 18))
                .frame(width: 250, height: 50)
                .lineLimit(2)
                .foregroundColor(.gray)
                .padding(.top, -10)
        }
    }

    private var progressViewGradient = LinearGradient(
        colors: [.progressViewBottomGradient, .progressViewTopGradient],
        startPoint: .leading,
        endPoint: .trailing
    )

    private var climateSettingsView: some View {
        DisclosureGroup(isExpanded: $climateViewModel.settings) {
            VStack {
                acClimateSettingView
                fanClimateSettingView
                heatClimateSettingView
                autoClimateSettingView
            }
        } label: {
            Text(Constants.Text.climateSettingsText)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)
        }
        .accentColor(.white)
        .padding()
    }

    private var acClimateSettingView: some View {
        HStack {
            Text(Constants.Text.acText)
                .font(.system(size: 17, weight: .semibold))
                .frame(width: 50)
            Button {
                climateViewModel.isAcButtonTapped.toggle()
            } label: {
                Image(Constants.Images.snowIconImageName)
                    .resizable()
                    .modifier(ButtonImageModifire())
            }
            .neumorphismUnSelectedCircleStyle()
            .overlay(
                Circle()
                    .stroke(gradient, lineWidth: 2)
                    .opacity(climateViewModel.isAcButtonTapped ? 1 : 0)
            )

            Slider(
                value: $climateViewModel.circleProgress,
                in: Constants.Integer.sliderRange,
                step: 1
            )
            .frame(width: 220)
        }
    }

    private var fanClimateSettingView: some View {
        HStack {
            Text(Constants.Text.fanText)
                .font(.system(size: 17, weight: .semibold))
                .frame(width: 50)
            Button {} label: {
                Image(Constants.Images.fanIconImageName)
                    .resizable()
                    .modifier(ButtonImageModifire())
            }
            .neumorphismUnSelectedCircleStyle()

            Slider(
                value: $climateViewModel.fanParameters,
                in: Constants.Integer.sliderRange,
                step: 1
            )
            .frame(width: 220)
        }
    }

    private var autoClimateSettingView: some View {
        HStack {
            Text(Constants.Text.autoText)
                .font(.system(size: 17, weight: .semibold))
                .frame(width: 50)
            Button {} label: {
                Image(Constants.Images.autoIconImageName)
                    .resizable()
                    .modifier(ButtonImageModifire())
            }
            .neumorphismUnSelectedCircleStyle()
            Slider(
                value: $climateViewModel.autoParameters,
                in: Constants.Integer.sliderRange,
                step: 1
            )
            .frame(width: 220)
        }
    }

    private var heatClimateSettingView: some View {
        HStack {
            Text(Constants.Text.heatText)
                .font(.system(size: 17, weight: .semibold))
                .frame(width: 50)
            Button {} label: {
                Image(Constants.Images.heatIconImageName)
                    .resizable()
                    .modifier(ButtonImageModifire())
            }
            .neumorphismUnSelectedCircleStyle()

            Slider(
                value: $climateViewModel.heatParameters,
                in: Constants.Integer.sliderRange,
                step: 1
            )
            .frame(width: 220)
        }
    }

    private var trimCirlceProgressView: some View {
        Circle()
            .trim(from: 0, to: climateViewModel.circleProgress / 15)
            .stroke(selectColorToGradient(), style: StrokeStyle(
                lineWidth: 25,
                lineCap: CGLineCap.round
            ))
            .frame(height: 180)
            .rotationEffect(.degrees(-90))
            .animation(.linear, value: climateViewModel.circleProgress)
            .padding(5)
            .neumorphismUnSelectedStyle()
    }

    private var screenNameTextView: some View {
        Text(Constants.Text.climateScreenNameText)
            .font(.system(size: 20, weight: .semibold))
    }

    private var backButtonView: some View {
        Button {
            self.presentation.wrappedValue.dismiss()
        } label: {
            Image(Constants.Images.backChevronImageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
                .frame(width: 20, height: 20)
        }
        .neumorhismNavigationCircleButtonUnselected()
    }

    private var settingsButtonView: some View {
        Button {
            climateViewModel.isAlertShown.toggle()
        } label: {
            Image(Constants.Images.gearshapeImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
        }
        .neumorhismNavigationCircleButtonUnselected()
        .overlay(
            Circle()
                .stroke(gradient, lineWidth: 2)
                .opacity(climateViewModel.isAlertShown ? 1 : 0)
        )
    }

    private var progressView: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.ellipseTopGradient, .ellipseBottomGradient],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 168.2)

            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .ellipseBottomGradient.opacity(0.4),
                            .internalCircleColor
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 119.25)
            if climateViewModel.isPowerButtonSelected {
                Text("\(climateViewModel.calculateActualTemperature())\(Constants.Text.celsiusText)")
                    .font(.system(size: 28.7, weight: .semibold))
            } else {
                EmptyView()
            }
        }
        .neumorphismUnSelectedStyle()
    }

    // MARK: - Private Methods

    private func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundElement)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .edgesIgnoringSafeArea(.all)
            content()
        }
    }

    private func selectColorToGradient() -> LinearGradient {
        LinearGradient(
            colors: [climateViewModel.color, Color.bottomGradient],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}

struct ClimateView_Previews: PreviewProvider {
    static var previews: some View {
        ClimateView()
            .environment(\.colorScheme, .dark)
    }
}
