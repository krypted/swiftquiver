//
//  Button+Default.swift
//  PingAddDevice
//
//

import SwiftUI


func FilledButton(_ title: String, action: @escaping () -> Void) -> some View {
    Button(action: action, label: {
        Text(title)
            .buttonFrame()
    })
    .buttonStyle(_FilledStyle())
}

private struct _FilledStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let color = configuration.isPressed ?
        Color.appBlue.opacity(0.8) :
        Color.appBlue
        
        return configuration
            .label
            .font(.system(size: 14).weight(.medium))
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(7.5)
    }
}


struct PButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let color = configuration.isPressed ?
        Color.appBlue.opacity(0.8) :
        Color.appBlue
        
        return configuration
            .label
            .buttonFrame()
            .font(.system(size: 14).weight(.medium))
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(7.15)
    }
}
