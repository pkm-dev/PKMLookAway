//
//  PKMLookAwayAppDelegate.swift
//  PKMLookAway
//
//  Created by Patrick Kobler on 31.12.2024.
//

import AppKit
import SwiftUI
import UserNotifications

class AppDelegate: NSObject, NSApplicationDelegate, UNUserNotificationCenterDelegate {
    var statusItem: NSStatusItem?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Request notification permissions
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
            if granted {
                print("Notification permission granted")
            }
        }
        
        // Setup menu bar item
        setupMenuBarItem()
    }
    
    func setupMenuBarItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "eye", accessibilityDescription: "Eye Protection")
        }
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Show", action: #selector(showApp), keyEquivalent: "s"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(quitApp), keyEquivalent: "q"))
        
        statusItem?.menu = menu
    }
    
    @objc func showApp() {
        NSApp.activate(ignoringOtherApps: true)
    }
    
    @objc func quitApp() {
        NSApp.terminate(nil)
    }
}
