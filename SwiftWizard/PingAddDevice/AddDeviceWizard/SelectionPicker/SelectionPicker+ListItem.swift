//
//  SelectionPicker+ListItem.swift
//  PingAddDevice
//
//

import SwiftUI

extension SelectionPicker {
    struct SelectionPickerListItem: View {
        @State private var itemBackgroundColor = Color.dropdown_background
        let text: String
        var _body: some View {
            VStack {
                Spacer()
                HStack {
                    Text(text)
                        .foregroundColor(Color.dropdown_placeholder)
                        .fontWeight(.medium)
                    Spacer()
                }
                .padding(.horizontal, 13)
                Spacer()
                Divider()
                    .background(Color.dropdown_placeholder.opacity(0.2))
                    .padding(.horizontal, 5)
            }
        }
        
        var body: some View {
            _body
                .background(itemBackgroundColor)
                .onHover { isOver in
                    withAnimation(.linear(duration: 0.2)) {
                        itemBackgroundColor = isOver ?
                        Color.dropdown_background_hover :
                        Color.dropdown_background
                    }
                }
            
        }
    }
}
