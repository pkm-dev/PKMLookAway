//
//  TimeManager.swift
//  PKMLookAway
//
//  Created by Patrick Kobler on 31.12.2024.
//

import Foundation
import UserNotifications

class TimerManager: ObservableObject {
    @Published var isRunning = false
    private var timer: Timer?
    private let breakDuration: TimeInterval = 20 // 20 seconds break
    
    func startTimer(workDuration: Double) {
        isRunning = true
        scheduleTimer(workDuration: workDuration)
    }
    
    func stopTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
  private func scheduleTimer(workDuration: Double) {
      timer?.invalidate()
      timer = Timer.scheduledTimer(withTimeInterval: workDuration * 60, repeats: true) { [weak self] _ in
          self?.showBreakNotification()
          
          // Schedule end of break notification
          DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(self?.breakDuration ?? 20))) {
              self?.showResumeNotification()
          }
      }
  }
    
    private func showBreakNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Take a Break!"
        content.body = "Look at something 20 feet away for 20 seconds"
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                          content: content,
                                          trigger: nil)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    private func showResumeNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Break Over"
        content.body = "You can continue working now"
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                          content: content,
                                          trigger: nil)
        
        UNUserNotificationCenter.current().add(request)
    }
}
