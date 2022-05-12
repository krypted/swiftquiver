//
//  DeviceAddressView.swift
//  PingAddDevice
//
//

import SwiftUI

struct DeviceAddress: View {
    @ObservedObject private var viewModel = DeviceAddressViewModel()
    @State private var ip: String?
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 30)
            Image(systemName: "list.bullet.rectangle")
                .resizable()
                .foregroundColor(.appBlue)
                .frame(width: 86, height: 73, alignment: .center)
                .scaledToFit()
                
            Text("Connection information")
                .font(.system(size: 25, weight: .medium))
            Spacer().frame(height: 24)
            VStack() {
                VStack(alignment: .leading) {
                    Text("Device's IP address type")
                        .font(.system(size: 11, weight: .regular))
                        .foregroundColor(.dropdown_placeholder)
                        .frame(alignment: .leading)
                    Spacer().frame(height: 1)
                    SelectionPicker(placeholder: "Select address type...", data: AddressType.casesAppText) { _ , text in
                        viewModel.selected = text
                    }
                }
                Spacer().frame(height: 30)
                PTextField(textChange: $ip)
            }
            Spacer()
            HStack(spacing: 35) {
                    //.buttonFrame()
                OutlineButton("Go back") {
                    NotificationCenter.default.post(name: .addDeviceBack, object: nil)
                }
                Button(AppText.Button.continue) {
                    NotificationCenter.default.post(name: .addDeviceNext, object: AddressType(fromAppText: viewModel.selected ?? "",
                                    value: ip ?? "")
                    )
                }
                    //.buttonFrame()
                    .buttonStyle(PButtonStyle())
                    
            }
        }.padding([.top, .bottom], 50)
    }
}
