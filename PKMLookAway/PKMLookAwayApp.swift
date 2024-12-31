//
//  PKMLookAwayApp.swift
//  PKMLookAway
//
//  Created by Patrick Kobler on 31.12.2024.
//
// This app follows the 20-20-20 rule recommended by eye care professionals: every 20 minutes,
// Take a 20-second break and look at something 20 feet away.
// The app will notify you when it's time to take a break and when to resume work.

import SwiftUI
import SwiftData

import SwiftUI

@main
struct EyeProtectionApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(replacing: .newItem) { }
        }
    }
}

/*
@main
struct PKMLookAwayApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
*/
