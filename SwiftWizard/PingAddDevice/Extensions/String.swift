//
//  String.swift
//  PingAddDevice
//
//

import Foundation

extension String {
    static var empty: String { "" }
    static var whitespace: String { " " }
}

extension String.StringInterpolation {
    mutating func appendInterpolation<T: CustomStringConvertible>(_ value: T?) {
            appendInterpolation(value ?? "nil" as CustomStringConvertible)
        }
    
    mutating func appendInterpolation<T>(_ value: T?) {
        guard let value = value else {
            return appendInterpolation("nil")
        }
            appendInterpolation(value)
        }
}
