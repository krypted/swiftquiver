//
//  AddDeviceViewModel.swift
//  PingAddDevice
//
//

import Foundation
import Combine

final class DeviceModelProvider {
    static var model = NewDeviceModel()
}

final class AddDeviceViewModel: ObservableObject {
    @Published var stepTitle: String = AppText.Title.addNewDevice
    @Published var stepIndex: Int = 0
    @Published var totalSteps: Int = AddDeviceSteps.allCases.count
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        observeStepsChange()
    }
    
    // MARK: Observing for
    
    func observeStepsChange() {
        NotificationCenter
            .default
            .publisher(for: .addDeviceNext)
            .sink(receiveValue: { [weak self] notification in
                self?.next()
                self?.handleDataUpdate(payload: notification.object)
            })
            .store(in: &cancellables)
        NotificationCenter
            .default
            .publisher(for: .addDeviceBack)
            .sink(receiveValue: { [weak self] notification in
                self?.back()
                self?.handleDataUpdate(payload: notification.object)
            })
            .store(in: &cancellables)
        
    }
    
    // MARK: Handling the received notification
    
    private func handleDataUpdate(payload: Any?) {
        guard let step = AddDeviceSteps(rawValue: stepIndex - 1) else { return }
        
        if step == .success {
            return end()
        }
        
        guard let payload = payload else { return }
        log(message: "Casting data update object.")
        if step == .deviceType,
           let type = payload as? DeviceType {
            updateDeviceType(type)
        } else if step == .naming,
                  let name = payload as? String {
            updateName(name)
        } else if step == .connectionInfo,
                  let type = payload as? AddressType {
            updateAddressType(type)
        } else if step == .monitorType,
                  let type = payload as? MonitorType {
            updateMonitorType(type)
        } else if step == .schedule,
                  let schedule = payload as? NewDeviceModel.Schedule {
            updateSchedule(schedule)
        } else if step == .notifications,
                  let notificationsSettings = payload as? NewDeviceModel.NotificationsSettings {
            updateNotificationsSettings(notificationsSettings)
        }
    }
    
    // MARK: Updating the values of model
    
    private func updateName(_ name: String) {
        log(message: "Updating device name to \(name).")
        DeviceModelProvider.model.name = name
    }
    
    private func updateDeviceType(_ type: DeviceType) {
        log(message: "Updating device type to \(type).")
        DeviceModelProvider.model.type = type
    }
    
    private func updateAddressType(_ type: AddressType) {
        log(message: "Updating address type to \(type).")
        DeviceModelProvider.model.ip = type
    }
    
    private func updateMonitorType(_ type: MonitorType) {
        log(message: "Updating monitor type to \(type).")
        DeviceModelProvider.model.monitorType = type
    }
    
    private func updateSchedule(_ schedule: NewDeviceModel.Schedule) {
        log(message: "Updating schedule.")
        log(message: "\(schedule)")
        DeviceModelProvider.model.schedule = schedule
    }
    
    private func updateNotificationsSettings(_ settings: NewDeviceModel.NotificationsSettings) {
        log(message: "Updating notification settings option set to \(settings)")
        DeviceModelProvider.model.notificationsSettings = settings
    }
    
    // MARK: Tracking current step
    
    private func next() {
        guard (0..<totalSteps).contains(stepIndex + 1) else {
            return
        }
        stepIndex += 1
    }
    
    private func back() {
        guard (0..<totalSteps).contains(stepIndex - 1) else {
            return
        }
        stepIndex -= 1
    }
    
    private func end() {
        
    }
}

extension Notification.Name {
    static let addDeviceNext = Notification.Name("AddDeviceViewModel.Current.Next")
    static let addDeviceBack = Notification.Name("AddDeviceViewModel.Current.Back")
}
