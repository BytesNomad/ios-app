//
//  VPNStatusViewModel.swift
//  IVPNClient
//
//  Created by Juraj Hilje on 28/02/2020.
//  Copyright © 2020 IVPN. All rights reserved.
//

import UIKit
import NetworkExtension

struct VPNStatusViewModel {
    
    // MARK: - Properties -
    
    var status: NEVPNStatus
    
    var protectionStatusText: String {
        switch status {
        case .connecting, .reasserting:
            return "Connecting"
        case .disconnecting:
            return "Disconnecting"
        case .connected:
            return "Protected"
        default:
            return "Unprotected"
        }
    }
    
    var connectToServerText: String {
        if UserDefaults.shared.isMultiHop {
            return "Entry Server"
        }
        
        switch status {
        case .connecting, .reasserting:
            return "Connecting to"
        case .connected:
            return "Connected to"
        case .disconnecting:
        return "Disconnecting from"
        default:
            return "Connect to"
        }
    }
    
    var connectToggleIsOn: Bool {
        switch status {
        case .connected, .connecting, .reasserting:
            return true
        default:
            return false
        }
    }
    
    var popupStatusText: String {
        switch status {
        case .connecting, .reasserting:
            return "Connecting VPN"
        case .disconnecting:
            return "Disconnecting VPN"
        case .connected:
            return "Your connection is protected"
        default:
            return "Everyone knows about your location"
        }
    }
    
    // MARK: - Initialize -
    
    init(status: NEVPNStatus) {
        self.status = status
    }
    
}
