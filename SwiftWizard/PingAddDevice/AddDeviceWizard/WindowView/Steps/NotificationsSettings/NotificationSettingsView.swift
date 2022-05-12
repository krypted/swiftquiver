//
//  ScheduleView.swift
//  PingAddDevice
//
//

import SwiftUI

struct NotificationsSettings: View {
    @ObservedObject private var viewModel = NotificationSettingsViewModel()
    @State private var port: String?
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 30)
            Image(systemName: "bell.badge")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.appBlue)
                .frame(width: 79, height: 79, alignment: .center)
                .scaledToFit()
                
            Text("Notificaitons settings")
                .font(.system(size: 25, weight: .medium))
            Spacer().frame(height: 24)
            VStack(alignment: .leading) {
                Checkbox(text: "Send notifications via email")
                    .onSelected { [weak viewModel] isSelected in
                        viewModel?.emailAllowed = isSelected
                    }
                Checkbox(text: "Show desktop notifications")
                    .onSelected { [weak viewModel] isSelected in
                        viewModel?.desktopAllowed = isSelected
                        print("\(isSelected)")
                    }
                Checkbox(isDisabled: true, text: "Send mobile notifications (in-app)")
                    .onSelected { [weak viewModel] isSelected in
                        viewModel?.mobileAllowed = isSelected
                    }
            }
            Spacer.v(21)
            UnderlineButton("Advanced options") {
                viewModel.openAdvancedOptions()
            }
            Spacer()
            HStack(spacing: 35) {
                OutlineButton("Go back") {
                    NotificationCenter.default.post(name: .addDeviceBack, object: nil)
                }
                Button(AppText.Button.continue) {
                    NotificationCenter.default.post(name: .addDeviceNext, object: viewModel.notificationsStruct())
                }
                    .buttonStyle(PButtonStyle())
                    
            }
        }.padding([.top, .bottom], 50)
    }
}

final class NotificationSettingsViewModel: ObservableObject {
    @Published var emailAllowed = false
    @Published var desktopAllowed = false
    @Published var mobileAllowed = false
    
    func notificationsStruct() -> NewDeviceModel.NotificationsSettings {
        NewDeviceModel.NotificationsSettings.bool(isEmailAllowed: emailAllowed,
                                                  isDesktopAllowed: desktopAllowed,
                                                  isMobileAllowed: mobileAllowed)
    }
    
    func openAdvancedOptions() {
        
    }
}
