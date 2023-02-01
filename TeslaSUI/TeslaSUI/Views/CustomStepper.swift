//
//  CustomStepper.swift
//  TeslaSUI
//
//  Created by Александр Андреевич Щепелин on 01.02.2023.
//

import SwiftUI

/// Кастомный степпер
struct CustomStepper: View {
    
    // MARK: - Public properties
        
    @Binding var value: Int
    
    var body: some View {
        HStack {
            Button {
                value -= 1
            } label: {
                Image(systemName: Constants.Images.chevronLeftImageName)
            }
            Text("\(15 + value)°")
                .font(.system(size: 34))
                .padding(.horizontal)
            Button {
                value += 1
            } label: {
                Image(systemName: Constants.Images.chevronRightImageName)
            }
        }
        .frame(width: 300, alignment: .center)
        .foregroundColor(.white)
    }
}
