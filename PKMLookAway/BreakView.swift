//
//  BreakView.swift
//  PKMLookAway
//
//  Created by Patrick Kobler on 31.12.2024.
//

import SwiftUI

struct BreakView: View {
    @State private var timeRemaining = 60
    @State private var timer: Timer?
    let onComplete: () -> Void
    
    var body: some View {
        ZStack {
            // Black background
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Take a Break!")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                Text("\(timeRemaining) seconds")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
            }
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                onComplete()
            }
        }
    }
}
