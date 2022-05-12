//
//  String+Localized.swift
//  PingAddDevice
//
//

import Foundation

extension String {
    var localized: Self {
        // TODO: Add optional handling
        NSLocalizedString(self, comment: "")
    }
}
