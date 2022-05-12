//
//  Localizable+Keys.swift
//  PingAddDevice
//
//

import Foundation

struct AppText {
    struct Button {
        static var `continue`: String { "button_continue".localized }
    }
    
    struct Title {
        static var addNewDevice: String { "add_new_device_title".localized }
        static var successStep: String { "add_new_device_step_title_success".localized }
        static func stepCounter(currentStep: Int, total: Int) -> String {
            String(format: "add_new_device_step_counter".localized,
                   arguments: ["\(currentStep)", "\(total)"])
        }
    }
}
