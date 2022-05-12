//
//  Colors.swift
//  PingAddDevice
//
//

import SwiftUI
import AppKit

extension Color {
    static let backgroundColor = Color("background")
    static let font = Color("font")
    static let appBlue = Color("appBlue")
    
    /* DROPDOWN */
    static let dropdown_background = Color("dropdown_background")
    static let dropdown_background_hover = Color("dropdown_background_hover")
    static let dropdown_icon = Color("dropdown_icon")
    static let dropdown_placeholder = Color("dropdown_placeholder")
    
    // Textfield
    static let textfield_titleText = Color("textfield_titleText")
    
    static let error = Color("error")
}

extension NSColor {
    static let appBlue = NSColor(named: "appBlue")!
    static let dropdown_placeholder = NSColor(named: "dropdown_placeholder")!
}
