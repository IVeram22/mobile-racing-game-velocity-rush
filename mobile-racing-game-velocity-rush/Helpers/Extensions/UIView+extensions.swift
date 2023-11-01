//
//  UIView+extensions.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

private enum Constants {
    static let radius: CGFloat = 10

    enum Shadow {
        static let shadowColor: CGColor = UIColor.black.cgColor
        static let shadowOpacity: Float = 0.5
        static let shadowOffset: CGSize = CGSize(width: 10, height: 10)
    }
    
    enum Background {
        static let color: UIColor = .black
        static let alpha: CGFloat = 0.5
    }
    
}

extension UIView {
    func cornerRadius(with radius: CGFloat = Constants.radius) {
        layer.cornerRadius = radius
    }
    
    func dropShadow(_ radius: CGFloat = Constants.radius) {
        layer.masksToBounds = false
        layer.shadowColor = Constants.Shadow.shadowColor
        layer.shadowOpacity = Constants.Shadow.shadowOpacity
        layer.shadowOffset = Constants.Shadow.shadowOffset
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
    
    func addBlackBackground() {
        let background = UIView(frame: self.frame)
        background.backgroundColor = Constants.Background.color
        background.alpha = Constants.Background.alpha
        addSubview(background)
    }
    
}
