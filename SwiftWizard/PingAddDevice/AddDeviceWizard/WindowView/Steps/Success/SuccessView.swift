//
//  SuccessView.swift
//  PingAddDevice
//
//

import SwiftUI

struct SuccessView: View {
    private let deviceType: DeviceType
    private let name: String
    
    init(
        deviceType: DeviceType,
        name: String
    ) {
        self.deviceType = deviceType
        self.name = name
    }
    
    
    var body: some View {
        HStack {
            Image.getDevice(deviceType)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .frame(width: 100, height: 100)
            Spacer.h(20)
            VStack(alignment: .leading) {
                Text("Your").font(.system(size: 25, weight: .medium))
                Text(name).font(.system(size: 29, weight: .bold))
                Text("is all set up!").font(.system(size: 25, weight: .medium))
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(deviceType: .other, name: "Main printer")
    }
}
