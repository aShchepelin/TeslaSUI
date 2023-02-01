// ContentView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Экран
struct CarSettingsView: View {

    // MARK: - Public Properties
    
    var body: some View {
        backgroundStackView {
            VStack {
                headerView
                carView
                controllPanelView
                navigationLinkView
                Spacer()
                    .frame(width: 40)
                if carSettingsViewModel.tagSelected == 1 {
                    closeCarControllView
                }
                Spacer()
            }
        }
    }
    
    // MARK: - Private Properties
    
    @StateObject private var carSettingsViewModel = CarSettingsViewModel()
    
    private var navigationLinkView: some View {
        NavigationLink(isActive: $carSettingsViewModel.isNavigationTapped) {
            ClimateView()
                .navigationBarBackButtonHidden()
        } label: {
            Text("")
        }
    }
    
    private var closeCarControllView: some View {
        Button {
            withAnimation {
                carSettingsViewModel.isCarClose.toggle()
            }
        } label: {
            HStack {
                Label {
                    Text(carSettingsViewModel.isCarClose ? Constants.Text.closedText : Constants.Text.openText)
                        .foregroundColor(.white)
                } icon: {
                    Image(systemName: carSettingsViewModel.isCarClose ? Constants.Images.lockOpenImageName
                          : Constants.Images.lockClosedImageName)
                        .renderingMode(.template)
                        .neumorphismUnSelectedCircleStyle()
                }
            }
            .padding()
            .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.backgrounElement)
                .neumorphismSelectedStyle()
            )
        }
        .frame(width: 300)

    }
    
    private var gradient: LinearGradient {
        LinearGradient(colors: [.topGradient, .bottomGradient],
                       startPoint: .bottom,
                       endPoint: .top)
    }
    
    private var controllPanelView: some View {
        HStack(spacing: 30) {
            ForEach(1..<5) { index in
                Button {
                    withAnimation {
                        carSettingsViewModel.tagSelected = index
                    }
                    if index == 2 {
                        carSettingsViewModel.isNavigationTapped.toggle()
                    }
                } label: {
                    Image("\(index)")
                        .resizable()
                        .frame(width: 44,
                        height: 44)
                        .neumorphismUnSelectedCircleStyle()
                        .overlay(
                        Circle()
                            .stroke(gradient, lineWidth: 2)
                            .opacity(carSettingsViewModel.tagSelected == index ? 1 : 0)
                        )
                }

            }
        }
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 50)
            .fill(Color.backgrounElement)
            .neumorphismUnSelectedStyle()
        )
    }
    
    private var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Constants.Text.teslaText)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(Constants.Text.kilometers)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .opacity(0.4)
            }
            Spacer()
        }
        .padding(.all, 25)
    }
    
    private var carView: some View {
        Image(carSettingsViewModel.isCarClose ? Constants.Images.teslaOpenImageName :
                Constants.Images.teslaMainImageName)
            .resizable()
            .scaledToFill()
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.bottom, 40)
            .shadow(color: .white.opacity(0.6),
                    radius: 15,
                    x: 10,
                    y: 10)
        
    }
    
    // MARK: - Private Methods
    
    private func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.backgrounElement)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            content()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CarSettingsView()
            .environment(\.colorScheme, .dark)
    }
}
