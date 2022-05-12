//
//  PTextfield.swift
//  PingAddDevice
//

import SwiftUI

//func PTextField(
//    _ placeholder: String = "",
//    text: Binding<String>,
//    title: String? = nil
//) -> some View {
//    VStack(alignment: .leading) {
//        if let title = title {
//            Text(title)
//                .font(.system(size: 11, weight: .regular))
//                .foregroundColor(Color.textfield_titleText)
//            Spacer().frame(width: .zero)
//        }
//        TextField(placeholder, text: text)
//            //.textFieldFrame()
//            .textFieldStyle(_PTextFieldStyle())
//            .padding(10)
//    }
//}
//
//private struct _PTextFieldStyle: TextFieldStyle {
//    func _body(configuration: TextField<_Label>) -> some View {
//        configuration
//            .border(Color.appBlue, width: 2)
//            .overlay(
//                RoundedRectangle(cornerRadius: 7.5)
//                    .stroke(Color.appBlue, lineWidth: 2)
//            )
//            
//    }
//}
//
//extension NSTextField {
//    open override var focusRingType: NSFocusRingType {
//        get { .none }
//        set { }
//    }
//}
