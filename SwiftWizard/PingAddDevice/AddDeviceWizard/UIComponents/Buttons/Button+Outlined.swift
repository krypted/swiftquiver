//
//  Button+Outlined.swift
//  PingAddDevice
//
//

import SwiftUI


func OutlineButton(_ title: String, action: @escaping () -> Void) -> some View {
    Button(action: action, label: {
        Text(title)
            .buttonFrame()
    })
    .buttonStyle(_OutlineStyle())
}

private struct _OutlineStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let color = configuration.isPressed ?
        Color.appBlue.opacity(0.8) :
        Color.appBlue
        
        return configuration
            .label
            .font(.system(size: 14).weight(.medium))
            .foregroundColor(color)
            .contentShape(Rectangle()) // keeps the transparent area clickable
            .overlay(
                RoundedRectangle(cornerRadius: 7.5)
                    .stroke(color, lineWidth: 2)
            )
    }
}
