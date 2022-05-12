//
//  Buttons+Underlined.swift
//  PingAddDevice
//
//

import SwiftUI

func UnderlineButton(_ title: String, action: @escaping () -> Void) -> some View {
    Button(action: action, label: {
        Text(title)
            .underline()
    })
    .buttonStyle(_UnderlineStyle())
}

private struct _UnderlineStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let color = configuration.isPressed ?
        Color.appBlue.opacity(0.8) :
        Color.appBlue
        
        return configuration
            .label
            .buttonFrame()
            .font(.system(size: 14).weight(.medium))
            .foregroundColor(color)
    }
}

