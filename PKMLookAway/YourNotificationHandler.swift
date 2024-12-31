//
//  YourNotificationHandler.swift
//  PKMLookAway
//
//  Created by Patrick Kobler on 31.12.2024.
//

func showBreakWindow() {
    let window = BreakWindow()
    window.makeKeyAndOrderFront(nil)
    
    // Optional: If you want to prevent the window from being closed
    NSApp.activate(ignoringOtherApps: true)
}
