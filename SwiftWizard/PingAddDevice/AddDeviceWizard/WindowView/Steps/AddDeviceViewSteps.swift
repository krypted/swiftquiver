//
//  AddDeviceViewSteps.swift
//  PingAddDevice
//
//

import Foundation

enum AddDeviceSteps: Int, Equatable, CaseIterable {
    case deviceType
    case naming
    case connectionInfo
    case monitorType
    case verification
    case schedule
    case notifications
    case success
    
    init(_ int: Int) {
        guard Self.allCases.count > int else {
            self = .success
            return
        }
        self = Self.allCases[int]
    }
}
