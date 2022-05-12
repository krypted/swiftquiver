//
//  DeviceSelectionView.swift
//  PingAddDevice
//
//

import SwiftUI

struct DeviceTypeSelection: View {
    @ObservedObject private var viewModel = DeviceTypeSelectionVM()
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 30)
            Image.getDevice(viewModel.selected)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(viewModel.selected == nil ? 0.3 : 1) // TODO: When not selected = 0.3 - selected = 1
                .frame(width: 200, height: 180, alignment: .center)
            Spacer().frame(height: 24)
            SelectionPicker(placeholder: "Select device type...",
                            data: DeviceType.allCases.map { $0.localized },
                            selectedIndex: viewModel.getSelectedIndex()) { _, text in
                let type = DeviceType(text)
                guard viewModel.selected != type else {
                    return
                }
                viewModel.selected = DeviceType(text)
            }
            Spacer()
            HStack {
                Button(AppText.Button.continue) {
                    NotificationCenter.default.post(name: .addDeviceNext, object: viewModel.selected)
                }
                    .buttonStyle(PButtonStyle())
                    
            }
        }.padding([.top, .bottom], 50)
    }
}
