//
//  NewDeviceModel.swift
//  PingAddDevice
//
//

import Foundation

/// Model that represents device which is being added.
///
/// This can change throughout all steps and should not be used as a database entry.
struct NewDeviceModel: CustomStringConvertible {
    /// The type of the device.
    var type: DeviceType?
    
    /// Name that user has given to the device.
    var name = ""
    
    /// Information about ip configuration of the device.
    var ip: AddressType?
    
    /// Type of monitoring the device needs.
    var monitorType: MonitorType?
    
    /// Schedule of check-ups of the device.
    var schedule: Schedule?
    
    /// Options for notifications
    /// Default value is an empty set.
    var notificationsSettings: NotificationsSettings = []
    
    struct Schedule: CustomStringConvertible {
        var checkFreq: TimeInterval
        var errorRetryAfter: TimeInterval
        
        var description: String {
            """
            Monitor schedule {
                Check device every \(checkFreq) seconds.
                When error occured retry after \(errorRetryAfter) seconds.
            }
            """
        }
    }
    
    struct NotificationsSettings: OptionSet {
        let rawValue: Int
        static let email = NotificationsSettings(rawValue: 1 << 0)
        static let desktop = NotificationsSettings(rawValue: 1 << 1)
        static let mobile = NotificationsSettings(rawValue: 1 << 2)
        
        static func bool(isEmailAllowed: Bool,
             isDesktopAllowed: Bool,
             isMobileAllowed: Bool) -> NotificationsSettings {
            var _set: NotificationsSettings = []
            
            if isEmailAllowed {
                _set.insert(.email)
            }
            
            if isDesktopAllowed {
                _set.insert(.desktop)
            }
            
            if isMobileAllowed {
                _set.insert(.mobile)
            }
            return _set
        }
    }
    
    var description: String {
        """
        NewDeviceModel {
            Name -> \(name)
            Type -> \(type)
            Ip -> \(ip)
            MonitorType -> \(monitorType)
            Schedule -> \(schedule)
            Notifications -> \(notificationsSettings)
        }
        """
    }
}
