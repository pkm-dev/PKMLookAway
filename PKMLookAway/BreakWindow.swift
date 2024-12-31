//
//  BreakWindow.swift
//  PKMLookAway
//
//  Created by Patrick Kobler on 31.12.2024.
//

import SwiftUI
import AppKit

class BreakWindow: NSWindow {
    init() {
        super.init(
            contentRect: NSScreen.main?.frame ?? .zero,
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )
        
        // Window configuration
        self.level = .screenSaver  // Places window above other windows
        self.backgroundColor = .clear
        self.isOpaque = false
        self.hasShadow = false
        self.collectionBehavior = [.canJoinAllSpaces, .fullScreenPrimary]
        
        // Set the content view
        let breakView = BreakView {
            self.close()  // Close window when timer completes
        }
        self.contentView = NSHostingView(rootView: breakView)
    }
}
