//
//  SwipesControlView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit

class SwipesControlView: UIView {
    var delegate: ControlRacerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeLeft))
        swipeLeftGesture.direction = .left
        addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeRight))
        swipeRightGesture.direction = .right
        addGestureRecognizer(swipeRightGesture)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleSwipeLeft() {
        delegate?.turnLeft()
    }
    
    @objc func handleSwipeRight() {
        delegate?.turnRight()
    }
    
}
