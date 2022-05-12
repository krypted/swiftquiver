//
//  PingAddDeviceApp.swift
//  PingAddDevice
//
//

import SwiftUI

@main
struct PingAddDeviceApp: App {
    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            AddDeviceView(viewModel: AddDeviceViewModel())
                .suggestedFrame()
                .background(Color.backgroundColor)
                .navigationTitle(String.empty)
        }
    }
}
