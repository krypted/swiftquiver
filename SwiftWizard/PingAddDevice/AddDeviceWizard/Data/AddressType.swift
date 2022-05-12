//
//  AddressType.swift
//  PingAddDevice
//
//

import Foundation

enum AddressType {
    case ipv4(String)
    case ipv6(String)
    
    static var casesAppText: [String] {
        [
            "IPv4", "IPv6"
        ]
    }
    
    init?(fromAppText appText: String, value: String) {
        if appText.lowercased() == "ipv4" {
            self = .ipv4(value)
        } else if appText.lowercased() == "ipv6" {
            self = .ipv6(value)
        } else {
            return nil
        }
    }
    
    func isValid() -> Bool {
        switch self {
        case .ipv4(let string): return true
        case .ipv6(let string): return true
        }
    }
}
