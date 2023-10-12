//
//  PlayerCarView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit

private enum Constants {
    static let shift: CGFloat = 50
    static let duration: TimeInterval = 0.3
}

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
        moveToX(with: -Constants.shift)
    }
    
    func moveToRight() {
        moveToX(with: Constants.shift)
    }
    
    private func moveToX(with x: CGFloat) {
        UIView.animate(withDuration: Constants.duration) { [self] in
            frame.origin.x += x
        } 
    }
    
}
