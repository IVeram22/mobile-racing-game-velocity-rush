//
//  PlayerCarView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit

final class PlayerCarView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = GlobalConstants.Car.colors[0]
        dropShadow()
        cornerRadius()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveToLeft() {
        moveToX(with: -50)
    }
    
    func moveToRight() {
        moveToX(with: 50)
    }
    
    private func moveToX(with x: CGFloat) {
        UIView.animate(withDuration: 0.3) { [self] in
            frame.origin.x += x
        } 
    }
    
}
