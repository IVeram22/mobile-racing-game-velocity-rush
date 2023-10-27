//
//  SwipesControlView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit

class SwipesControlView: BaseControlView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(turnLeft))
        swipeLeftGesture.direction = .left
        addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(turnRight))
        swipeRightGesture.direction = .right
        addGestureRecognizer(swipeRightGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
