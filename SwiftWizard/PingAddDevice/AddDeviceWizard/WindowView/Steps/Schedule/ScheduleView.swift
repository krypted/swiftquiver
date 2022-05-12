//
//  ScheduleView.swift
//  PingAddDevice
//
//

import SwiftUI

struct ScheduleView: View {
    @ObservedObject private var viewModel = ScheduleViewModel()
    @State private var port: String?
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 30)
            Image(systemName: "clock.arrow.circlepath")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.appBlue)
                .frame(width: 79, height: 79, alignment: .center)
                .scaledToFit()
                
            Text("Timeline settings")
                .font(.system(size: 25, weight: .medium))
            Spacer().frame(height: 24)
            HStack {
                VStack(alignment: .leading) {
                    Text("Check frequency")
                        .font(.system(size: 17.15, weight: .regular))
                    Stepper(value: $viewModel.checkFrequency,
                            range: 1...60) { value in
                        Text("\(value) ").font(.system(size: 23, weight: .semibold))
                        + Text("min").font(.system(size: 17.15, weight: .light))
                    }
                }
                Spacer.h(22)
                VStack(alignment: .leading) {
                    Text("When error retry after")
                        .font(.system(size: 17.15, weight: .regular))
                    Stepper(value: $viewModel.retryFrequency,
                            range: 1...60) { value in
                        Text("\(value) ").font(.system(size: 23, weight: .semibold))
                        + Text("min").font(.system(size: 17.15, weight: .light))
                    }
                }
            }
            Spacer.v(21)
            UnderlineButton("Custom schedule") {
                viewModel.openCustomSchedule()
            }
            Spacer()
            HStack(spacing: 35) {
                    //.buttonFrame()
                OutlineButton("Go back") {
                    NotificationCenter.default.post(name: .addDeviceBack, object: nil)
                }
                Button("Continue") {
                    NotificationCenter.default.post(name: .addDeviceNext, object: viewModel.scheduleStruct())
                }
                    //.buttonFrame()
                    .buttonStyle(PButtonStyle())
                    
            }
        }.padding([.top, .bottom], 50)
    }
}

final class ScheduleViewModel: ObservableObject {
    @Published var checkFrequency: Int = 5
    @Published var retryFrequency: Int = 5
    
    func scheduleStruct() -> NewDeviceModel.Schedule {
        NewDeviceModel.Schedule(checkFreq: Double(checkFrequency * 60),
                                errorRetryAfter: Double(retryFrequency * 60))
    }
    
    func openCustomSchedule() {
        
    }
}
