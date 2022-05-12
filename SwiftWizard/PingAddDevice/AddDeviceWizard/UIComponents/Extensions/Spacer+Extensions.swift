//
//  Spacer+Extensions.swift
//  PingAddDevice
//
//

import SwiftUI

extension Spacer {
    static func h(_ value: CGFloat) -> some View {
        Spacer()
            .frame(width: value)
    }
    
    static func v(_ value: CGFloat) -> some View {
        Spacer()
            .frame(height: value)
    }
}
