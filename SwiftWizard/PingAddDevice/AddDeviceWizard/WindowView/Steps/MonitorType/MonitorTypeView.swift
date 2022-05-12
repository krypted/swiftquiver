//
//  DeviceAddressView.swift
//  PingAddDevice
//
//

import SwiftUI

struct MonitorTypeView: View {
    @ObservedObject private var viewModel = MonitorTypeViewModel()
    @State private var port: String?
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 30)
            Image(systemName: "externaldrive.connected.to.line.below")
                .resizable()
                .foregroundColor(.appBlue)
                .frame(width: 79, height: 79, alignment: .center)
                .scaledToFit()
                
            Text("Choose monitor type")
                .font(.system(size: 25, weight: .medium))
            Spacer().frame(height: 24)
            VStack() {
                SelectionPicker(placeholder: "Select type...", data: MonitorType.allCases.map { $0.rawValue }) { _ , text in
                    viewModel.selected = text
                }
                if let _selected = viewModel.selected,
                   let selected = MonitorType(rawValue: _selected),
                   selected == .portScanner {
                    Spacer().frame(height: 15)
                    VStack(alignment: .leading) {
                        Text("Port you want to monitor")
                            .font(.system(size: 11, weight: .regular))
                            .foregroundColor(.dropdown_placeholder)
                        Spacer().frame(height: 1)
                        PTextField(textChange: $port)
                    }
                }
                Spacer().frame(height: 30)
                
            }
            Spacer()
            HStack(spacing: 35) {
                    //.buttonFrame()
                OutlineButton("Go back") {
                    NotificationCenter.default.post(name: .addDeviceBack, object: nil)
                }
                Button("Continue") {
                    NotificationCenter.default.post(name: .addDeviceNext, object: viewModel.selected)
                }
                    //.buttonFrame()
                    .buttonStyle(PButtonStyle())
                    
            }
        }.padding([.top, .bottom], 50)
    }
}
