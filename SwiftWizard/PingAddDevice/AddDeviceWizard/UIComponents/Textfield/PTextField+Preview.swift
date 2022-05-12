//
//  PTextField+Preview.swift
//  PingAddDevice
//
//

import SwiftUI
import Combine

struct PTextField_Preview: View {
    @State var text: String? = ""
    var body: some View {
        VStack {
            PTextField(textChange: $text)
            PTextField(textChange: $text)
            Text(text)
        }
        
    }
    
}

struct PTextField_Preview_Previews: PreviewProvider {
    static var previews: some View {
        PTextField_Preview()
    }
}
