//
//  BaseControlView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 13.10.23.
//

import UIKit

class BaseControlView: UIView {
    var delegate: ControlRacerDelegate?
    
}

extension BaseControlView: PlayerControl {
    @objc func turnRight() {
        delegate?.turnRight()
    }
    
    @objc func turnLeft() {
        delegate?.turnLeft()
    }
    
}
