//
//  Button+Preview.swift
//  PingAddDevice
//
//

import SwiftUI

struct ButtonsShowcase: View {
    var body: some View {
        VStack {
            FilledButton("Continue") {
                print("Hello")
            }
            OutlineButton("Continue") {
                print("Hello")
            }
            
            UnderlineButton("Continue") {
                print("Hello")
            }
        }
    }
}

struct ButtonsShowcase_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsShowcase()
    }
}
