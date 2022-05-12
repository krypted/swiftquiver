//
//  AppDelegate.swift
//  PingAddDevice
//
//

import Foundation
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("\(#function)")
        guard let window = NSApplication.shared.windows.first else {
            return
        }
        
        window.standardWindowButton(.zoomButton)?.isHidden = true
        window.standardWindowButton(.miniaturizeButton)?.isHidden = true
        window.titlebarSeparatorStyle = .none
        window.titlebarAppearsTransparent = true
        window.isMovableByWindowBackground = true
        NSApp.appearance = NSAppearance(named: .vibrantLight)
        //window.hasShadow = false
    }
}
