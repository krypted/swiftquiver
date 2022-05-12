//
//  Checkbox.swift
//  PingAddDevice
//
//

import SwiftUI

struct Checkbox: View {
    @State var isSelected: Bool
    @State var isDisabled: Bool
    var text: String?
    private var onSelected: ((Bool) -> Void)?
    
    func iconColor(isDisabled: Bool) -> Color {
        isDisabled ?
        Color.dropdown_placeholder :
        Color.appBlue
    }
    
    func textColor(isDisabled: Bool) -> Color {
        isDisabled ?
        Color.dropdown_placeholder :
        Color.black
    }
    
    init(
        isSelected: Bool = false,
        isDisabled: Bool = false,
        text: String? = nil
    ) {
        self.isSelected = isSelected
        self.isDisabled = isDisabled
        self.text = text
    }
    
    var body: some View {
        Button {
            if !isDisabled {
                isSelected.toggle()
                onSelected?(isSelected)
            }
        } label: {
            HStack {
                if isSelected {
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .foregroundColor(iconColor(isDisabled: isDisabled))
                        .frame(width: 20, height: 20)
                } else {
                    Image(systemName: "square")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .foregroundColor(iconColor(isDisabled: isDisabled))
                        .font(.system(size: 50, weight: .medium))
                        .frame(width: 20, height: 20)
                }
                if let text = text {
                    Text(text)
                        .font(.system(size: 17.15, weight: .regular))
                        .foregroundColor(textColor(isDisabled: isDisabled))
                        
                }
            }
        }.background(.clear)
        .buttonStyle(PlainButtonStyle())
        .disabled(isDisabled)
    }
}

extension Checkbox {
    func onSelected(_ handler: @escaping (Bool) -> ()) -> Self {
        var new = self
        new.onSelected = handler
        return new
    }
}



struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox(isDisabled: false, text: "Dupa")
    }
}
