//
//  BubbleButton.swift
//  LogMeByGPS
//
//  Created by Marco Spicciani on 05/07/22.
//

import Foundation

import SwiftUI

struct BubbleButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.white)
            .foregroundColor(.blue)
            .font(.body.bold())
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
