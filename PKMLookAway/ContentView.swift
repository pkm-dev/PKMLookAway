//
//  ContentView.swift
//  PKMLookAway
//
//  Created by Patrick Kobler on 31.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timerManager = TimerManager()
    @AppStorage("workDuration") private var workDuration: Double = 20
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Eye Protection")
                .font(.title)
            
            VStack {
                Text("Work Duration (minutes)")
                Slider(value: $workDuration, in: 1...60, step: 1)
                Text("\(Int(workDuration)) minutes")
            }
            .padding()
            
            Button(timerManager.isRunning ? "Stop" : "Start") {
                if timerManager.isRunning {
                    timerManager.stopTimer()
                } else {
                    timerManager.startTimer(workDuration: workDuration)
                }
            }
            .buttonStyle(.borderedProminent)
            
            Text("Status: \(timerManager.isRunning ? "Running" : "Not Running")")
                .foregroundColor(timerManager.isRunning ? .green : .red)
        }
        .padding()
        .frame(width: 300, height: 200)
    }
}

/*
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
*/
