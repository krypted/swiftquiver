//
//  SelectionPicker+List.swift
//  PingAddDevice
//
//

import SwiftUI
import Combine

extension SelectionPicker {
    struct SelectionPickerList: View {
        let items: [String]
        private let onSelected: (Int) -> Void
        
        init(data: [String], onSelected: @escaping (Int) -> Void) {
            items = data
            self.onSelected = onSelected
        }
        
        var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                Rectangle()
                    .foregroundColor(Color.dropdown_background)
                    .frame(height: 10)
                VStack {
                    ForEach(Array(items.enumerated()), id: \.element) { index, name in
                        SelectionPickerListItem(text: name)
                            .onTapGesture { onSelected(index) }
                        Spacer().frame(height: .zero)
                    }
                }
            }
        }
    }
}
