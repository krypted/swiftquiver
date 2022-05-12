//
//  PTextField+Frame.swift
//  PingAddDevice
//
//

import SwiftUI

extension View {
    func textFieldFrame() -> some View {
        frame(minWidth: 260,
              idealWidth: 260,
              maxWidth: 260,
              minHeight: 58,
              idealHeight: 58,
              maxHeight: 58,
              alignment: .center)
    }
}
