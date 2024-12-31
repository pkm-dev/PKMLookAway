//
//  LaunchAtLogin.swift
//  PKMLookAway
//
//  Created by Patrick Kobler on 31.12.2024.
//

import ServiceManagement

func enableLaunchAtLogin() {
    guard let bundleIdentifier = Bundle.main.bundleIdentifier else { return }
    
    if #available(macOS 13.0, *) {
        try? SMAppService.mainApp.register()
    } else {
        let configuration = SMLoginItemSetEnabled(bundleIdentifier as CFString, true)
      print(configuration)
    }
}
