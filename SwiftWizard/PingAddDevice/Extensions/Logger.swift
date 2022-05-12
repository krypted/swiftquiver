//
//  Logger.swift
//  PingAddDevice
//
//

import Foundation

enum LogType: String {
    case debug
    case error
}

enum MetaModuleComponents: String {
    case picker = "Picker view"
    case addDeviceView = "Add device view"
    case deviceTypeSelection = "Device type selection view"
}

func log(
    _ logType: LogType = .debug,
    component: MetaModuleComponents? = nil,
    message: String,
    _ function: String = #function,
    _ line: Int = #line,
    _ file: String = #filePath
) {
    var _message = String.empty
    _message +=  logType.rawValue.squared()
    _message += Date().log().squared()
    _message += (file.pathToFile() + ":" + String(line) + function).squared()
    _message += component?.rawValue.squared() ?? .empty
    _message += message.prespaced()
    print(_message)
}

fileprivate extension String {
    func squared() -> String { "[\(self)]" }
    func pathToFile() -> String {
        String(
            split(separator: "/")
            .last?
            .split(separator: ".")
            .first ?? Substring(String.empty)
        )
    }
    func prespaced() -> String {
        .whitespace + self
    }
}

fileprivate extension Date {
    func log() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss.SSS"
        return "[\(formatter.string(from: self))]"
    }
}




