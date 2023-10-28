//
//  AccelerometerControlView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit
import CoreMotion

private enum Constants {
    static let duration: TimeInterval = 0.3
}

final class AccelerometerControlView: BaseControlView {
    private let manager = CMMotionManager()
    private var timer: Timer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func startTimer() {
        guard manager.isAccelerometerAvailable else { return }
        manager.startAccelerometerUpdates()
        timer = Timer.scheduledTimer(withTimeInterval: Constants.duration, repeats: true) { [weak self] _ in
            if let data = self?.manager.accelerometerData {
                let shift = data.acceleration.x
                
                if shift > 0.1 {
                    self?.turnRight()
                }
                
                if shift < -0.1 {
                    self?.turnLeft()
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        manager.stopAccelerometerUpdates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
