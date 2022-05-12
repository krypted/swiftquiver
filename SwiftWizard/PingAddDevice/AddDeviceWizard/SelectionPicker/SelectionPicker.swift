//
//  SelectionPicker.swift
//  PingAddDevice
//
//

import SwiftUI

struct SelectionPicker: View {
    @State private var isSelected: Bool = false
    @State private var text: String
    @State private(set) var selectedItem: (Int, String)?
    private let onSelected: (Int, String) -> Void
    let items: [String]
    
    /// Selection picker with text items
    /// - Parameters:
    ///   - placeholder: Text displayed when there is no selected item
    ///   - data: Items displayed in the selection list
    ///   - selectedIndex: (Optional) Initally selected index in `data` items
    ///   - onSelected: Closure called when selected item changes
    init(placeholder: String,
         data: [String],
         selectedIndex: Int? = nil,
         onSelected: @escaping (Int, String) -> Void = { _, _ in }) {
        items = data
        self.onSelected = onSelected
        if let selectedIndex = selectedIndex,
           items.count > selectedIndex {
            // When initial selected index is provided
            let itemText = items[selectedIndex]
            text = itemText
            let _selectedItem = (selectedIndex, itemText)
            selectedItem = _selectedItem
            self.onSelected(selectedIndex, itemText)
        } else {
            text = placeholder
        }
    }
    
    var body: some View {
        VStack {
            Button(text) {
                isSelected.toggle()
            }
            .buttonStyle(SelectionPickerButtonStyle())
                if isSelected {
                    SelectionPickerList(data: items) { selectedIndex in
                        isSelected = false
                        let itemText = items[selectedIndex]
                        selectedItem = (selectedIndex, itemText)
                        text = itemText
                        onSelected(selectedIndex, itemText)
                    }
                    .offset(x: 0, y: 30)
                    .frame(width: 210, height: 100, alignment: .bottom)
                }
            //Spacer().frame(height: 0)
            
        }
    }
}

struct SelectionPicker_Previews: PreviewProvider {
    static var previews: some View {
        SelectionPicker(placeholder: "Select...", data: [
            "Select 1", "Select 2", "Select 3"
        ]) { _, _ in }
        .frame(alignment: .top)
    }
}
