//
//  AccelerometerControlView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit
import CoreMotion

// TODO: Can't test this with simulator
final class AccelerometerControlView: BaseControlView {
    private let manager = CMMotionManager()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        manager.startAccelerometerUpdates()
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            if let data = self.manager.accelerometerData {
                let _ = data.acceleration.x
            }
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//extension AccelerometerControlView: PlayerControl {
//    @objc func turnRight() {
//        delegate?.turnRight()
//    }
//
//    @objc func turnLeft() {
//        delegate?.turnLeft()
//    }
//
//}
