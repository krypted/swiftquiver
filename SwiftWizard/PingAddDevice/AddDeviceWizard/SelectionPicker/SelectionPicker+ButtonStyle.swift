//
//  SelectionPicker+ButtonStyle.swift
//  PingAddDevice
//
//

import SwiftUI

extension SelectionPicker {
    struct SelectionPickerButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            let _view = HStack {
                Image.dropdown_icon
                Spacer().frame(width: 6)
                configuration.label
                    .font(.system(size: 14))
                    .foregroundColor(Color.dropdown_placeholder)
                Spacer()
            }
                .padding(.vertical, 13.5)
                .padding(.horizontal, 13)
            .frame(width: 210, height: 35)
        return _view
                .background(Color.dropdown_background)
                .cornerRadius(7.15)
        }
    }
}
