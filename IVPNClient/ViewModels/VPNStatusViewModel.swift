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
            return "connecting"
        case .disconnecting:
            return "disconnecting"
        case .connected:
            return "protected"
        default:
            return "unprotected"
        }
    }
    
    var connectToServerText: String {
        switch status {
        case .connected:
            return "Connected to"
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
    
    // MARK: - Initialize -
    
    init(status: NEVPNStatus) {
        self.status = status
    }
    
}
