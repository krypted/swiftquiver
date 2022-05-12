//
//  AddDeviceView.swift
//  PingAddDevice
//
//

import SwiftUI
import Combine

struct AddDeviceView: View {
    @ObservedObject private var viewModel: AddDeviceViewModel
    
    private func getTextForTitle() -> String {
        let text: String
        if AddDeviceSteps(viewModel.stepIndex) == .success {
            text = AppText.Title.successStep
        } else {
            text = viewModel.stepTitle
        }
        return text
    }
    
    var body: some View {
        var _body: some View {
            VStack {
                HStack {
                    Text(getTextForTitle())
                        .font(.system(size: 40))
                        .fontWeight(.semibold)
                        .padding(.leading, 50)
                        .padding(.top, 30)
                        .foregroundColor(.font)
                    Spacer()
                }
                if AddDeviceSteps(viewModel.stepIndex) != .success {
                    HStack {
                        Text(AppText.Title.stepCounter(
                            currentStep: viewModel.stepIndex + 1,
                            total: viewModel.totalSteps
                        ))
                            .font(.system(size: 31))
                            .fontWeight(.medium)
                            .padding(.leading, 50)
                            .foregroundColor(.font)
                        Spacer()
                    }
                }
                
                // All steps logic
                switch viewModel.stepIndex {
                case 0: DeviceTypeSelection()
                case 1: NameYourDevice()
                case 2: DeviceAddress()
                case 3: MonitorTypeView()
                case 4: TestConnection()
                case 5: ScheduleView()
                case 6: NotificationsSettings()
                default: EmptyView()
                }
                
                // Final success step
                if AddDeviceSteps(viewModel.stepIndex) == .success {
                    VStack(alignment: .center) {
                        Spacer()
                        SuccessView(deviceType: DeviceModelProvider.model.type ?? .router,
                                    name: DeviceModelProvider.model.name)
                        Spacer()
                        Button(AppText.Button.continue) {
                            NotificationCenter.default.post(name: .addDeviceNext, object: nil)
                        }
                        .buttonStyle(PButtonStyle())
                        Spacer.v(50)
                    }
                }
                Spacer()
            }
        }
        
        return _body
    }
    
    init(viewModel: AddDeviceViewModel) {
        self.viewModel = viewModel
    }
}

extension AddDeviceView {
    func suggestedFrame() -> some View {
        frame(minWidth: 550,
              idealWidth: 550,
              maxWidth: 550,
              minHeight: 727,
              idealHeight: 727,
              maxHeight: 727,
              alignment: .top)
    }
}

extension Text {
    init(_ content: String?) {
        let string: some StringProtocol = content ?? String.empty
        self.init(string)
    }
}

struct AddDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeviceView(viewModel: AddDeviceViewModel())
    }
}
