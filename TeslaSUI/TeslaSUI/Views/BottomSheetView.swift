// BottomSheetView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Универсальный боттомшит
struct BottomSheetView<Content: View>: View {
    
    // MARK: - Public Propeties
    
    let content: () -> Content
    
    var body: some View {
        ZStack {
            content()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                .background(
                    .ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 10))
                .ignoresSafeArea(.all, edges: .bottom)
                .offset(y: UIScreen.main.bounds.height / 2 + 100)
                .offset(y: currentMenuOffsetY)
                .gesture(dragGesture)
        }
        .ignoresSafeArea(edges: .top)
    }
    
    // MARK: - Private Propeties
    
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentMenuOffsetY: CGFloat = 0.0
    @State private var lastMenuOffsetY: CGFloat = 0.0
    
    private var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, _ in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded { _ in
                let maxHeight = UIScreen.main.bounds.height / 6
                
                withAnimation {
                    if -currentMenuOffsetY > maxHeight / 2 {
                        currentMenuOffsetY = -maxHeight
                    } else {
                        currentMenuOffsetY = 0
                    }
                    lastMenuOffsetY = currentMenuOffsetY
                }
            }
    }
    
    // MARK: - Private Methods
    
   private func onChangeMenuOffset() {
        DispatchQueue.main.async {
            currentMenuOffsetY = gestureOffset.height + lastMenuOffsetY
        }
    }
    
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView {
            VStack {
                Capsule()
                    .fill(.white)
                    .frame(width: 80, height: 3)
                    .padding(.top)
                ForEach(0..<4) { _ in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                        .frame(height: 100)
                        .padding(.horizontal)
                }
                Spacer()
            }
        }
    }
}
