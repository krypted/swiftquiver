//
//  DeviceType.swift
//  PingAddDevice
//
//

import Foundation

enum DeviceType: String, CaseIterable {
    case router
    case leakSensor
    case lock
    case co2Sensor
    case climateControl
    case camera
    case wallSwitch
    case smartBulb
    case other
    
    init(_ string: String) {
        switch string
            .lowercased()
            .replacingOccurrences(of: String.whitespace, with: String.empty) {
        case "router": self = .router
        case "leaksensor": self = .leakSensor
        case "lock": self = .lock
        case "co2sensor": self = .co2Sensor
        case "climatecontrol": self = .climateControl
        case "camera": self = .camera
        case "smartbulb": self = .smartBulb
        case "switch": self = .wallSwitch
        default: self = .other
        }
    }
    
    var localized: String {
        "device_type_name_\(rawValue)".localized
    }
}


