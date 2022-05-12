//
//  NameYourDevice.swift
//  PingAddDevice
//
//  Created by Patryk Budzinski on 14/04/2022.
//

import SwiftUI

struct NameYourDevice: View {
    @State private var name: String?
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 30)
            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                .resizable()
                .foregroundColor(.appBlue)
                .frame(width: 105, height: 75, alignment: .center)
                .scaledToFit()
                
            Text("Name your device")
                .font(.system(size: 25, weight: .medium))
            Spacer().frame(height: 24)
            VStack(alignment: .leading) {
                Text("Device name")
                    .font(.system(size: 11, weight: .regular))
                    .foregroundColor(.dropdown_placeholder)
                Spacer().frame(height: 1)
                PTextField(textChange: $name)
            }
            Spacer()
            HStack(spacing: 35) {
                    //.buttonFrame()
                OutlineButton("Go back") {
                    NotificationCenter.default.post(name: .addDeviceBack, object: nil)
                }
                Button("Continue") {
                    NotificationCenter.default.post(name: .addDeviceNext, object: name)
                }
                    //.buttonFrame()
                    .buttonStyle(PButtonStyle())
                    
            }
        }.padding([.top, .bottom], 50)
    }
}
