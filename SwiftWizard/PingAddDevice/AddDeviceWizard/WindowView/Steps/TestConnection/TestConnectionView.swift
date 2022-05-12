//
//  DeviceAddressView.swift
//  PingAddDevice
//
//

import SwiftUI

struct TestConnection: View {
//    @ObservedObject private var viewModel = MonitorTypeViewModel()
    @State var connectionState = ConnectionState.connecting
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            if connectionState == .connecting {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                Spacer().frame(height: 5)
                Text("Connecting to your device")
                    .font(.system(size: 25, weight: .medium))
            } else if connectionState == .success {
                Image(systemName: "externaldrive.fill.badge.checkmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.appBlue)
                    .frame(width: 84, height: 73, alignment: .center)
                    .scaledToFit()
                    
                    
                Text("Your device is online")
                    .font(.system(size: 25, weight: .medium))
            } else if connectionState == .error {
                Image(systemName: "externaldrive.fill.badge.xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.error)
                    .frame(width: 84, height: 73, alignment: .center)
                    .scaledToFit()
                Text("Could not connect to your device")
                    .font(.system(size: 25, weight: .medium))
                UnderlineButton("Continue anyway") {
                    NotificationCenter.default.post(name: .addDeviceNext, object: nil)
                }
            }
            Spacer()
            HStack(spacing: 35) {
                OutlineButton("Go back") {
                    //NotificationCenter.default.post(name: .addDeviceBack, object: nil)
                    connectionState = connectionState == .connecting ? .success : .error
                    
                }
                if connectionState == .success {
                    Button("Continue") {
                        NotificationCenter.default.post(name: .addDeviceNext, object: nil)
                    }
                    .buttonStyle(PButtonStyle())
                    
                }
            }
        }.padding([.bottom], 50)
    }
}

enum ConnectionState {
    case success
    case error
    case connecting
}
