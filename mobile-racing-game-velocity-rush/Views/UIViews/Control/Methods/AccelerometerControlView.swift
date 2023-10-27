//
//  AccelerometerControlView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit
import CoreMotion

// TODO: Can't test this with simulator
// TODO: Make smooth animation
final class AccelerometerControlView: BaseControlView {
    private let manager = CMMotionManager()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        manager.startAccelerometerUpdates()
        guard manager.isAccelerometerAvailable else { return }
        
//        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self] _ in
//            if let data = self?.manager.accelerometerData {
//                
//                let shift = data.acceleration.x
//                print(shift)
//                
//                if shift > 0.1 {
//                    self?.turnRight()
//                }
//                
//                if shift < -0.1 {
//                    self?.turnLeft()
//                }
//            }
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
