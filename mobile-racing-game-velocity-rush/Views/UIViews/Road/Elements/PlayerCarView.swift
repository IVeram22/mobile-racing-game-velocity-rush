//
//  PlayerCarView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit

private enum Constants {
    static let mainShift: CGFloat = 50
    static let sideShift: CGFloat = 20
    static let margin: CGFloat = 10
    static let duration: TimeInterval = 0.3
}

final class PlayerCarView: UIView {
    init(frame: CGRect, with index: Int) {
        super.init(frame: frame)
        backgroundColor = GlobalConstants.Cars.colors[index]
        dropShadow()
        cornerRadius()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveToLeft() {
        let newX: CGFloat
        
        if Constants.margin + Constants.mainShift < frame.origin.x {
            newX = frame.origin.x - Constants.mainShift
        } else if Constants.margin + Constants.sideShift / 2 < frame.origin.x {
            newX = frame.origin.x - Constants.sideShift
        } else {
            return
        }
        
        moveToX(with: newX - frame.origin.x)
    }
    
    func moveToRight() {
        let screenWidth = UIScreen.main.bounds.width
        let newX: CGFloat
        
        if frame.origin.x + frame.width + Constants.mainShift < screenWidth - Constants.margin {
            newX = frame.origin.x + Constants.mainShift
        } else if frame.origin.x + frame.width + Constants.sideShift < screenWidth {
            newX = frame.origin.x + Constants.sideShift
        } else {
            return
        }
        
        moveToX(with: newX - frame.origin.x)
    }
    
    private func moveToX(with x: CGFloat) {
        UIView.animate(withDuration: Constants.duration) { [self] in
            frame.origin.x += x
        }
    }
    
}
