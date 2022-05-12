//
//  DeviceSelectionViewModel.swift
//  PingAddDevice
//
//

import Combine

final class DeviceTypeSelectionVM: ObservableObject {
    @Published var selected: DeviceType?
    
    func getSelectedIndex() -> Int? {
        guard let type = DeviceModelProvider.model.type else {
            return nil
        }
        
        return DeviceType.allCases.firstIndex(of: type)
    }
}

