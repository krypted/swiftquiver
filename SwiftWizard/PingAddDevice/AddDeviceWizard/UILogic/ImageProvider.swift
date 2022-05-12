//
//  ImageProvider.swift
//  PingAddDevice
//
//

import Foundation
import SwiftUI

extension Image {
    static func getDevice(_ type: DeviceType?) -> Image {
        let typeText: String
        switch type {
        case .router: typeText = "router"
        case .leakSensor: typeText = "leak_sensor"
        case .lock: typeText = "lock"
        case .co2Sensor: typeText = "co2_sensor"
        case .climateControl: typeText = "climate"
        case .camera: typeText = "camera"
        case .smartBulb: typeText = "bulb"
        case .wallSwitch: typeText = "wallSwitch"
        default: typeText = "router" // TODO: Change it to generic image
        }
        return Image("device_illustration_\(typeText)")
    }
}








