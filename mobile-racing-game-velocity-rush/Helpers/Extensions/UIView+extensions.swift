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
    
    enum Shake {
        static let duration: CFTimeInterval = 0.05
        static let shakeAnimation: String = "ShakeCarAnimationKey"
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
    
    func shakeAnimation(repeatCount: Float) {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = Constants.Shake.duration
        shakeAnimation.repeatCount = repeatCount
        shakeAnimation.autoreverses = true
        
        let fromPoint = CGPoint(x: self.center.x - 0.8, y: self.center.y)
        let toPoint = CGPoint(x: self.center.x + 0.8, y: self.center.y)
        shakeAnimation.fromValue = NSValue(cgPoint: fromPoint)
        shakeAnimation.toValue = NSValue(cgPoint: toPoint)
        
        self.layer.add(shakeAnimation, forKey: "shake")
    }
    
    func stopShakeAnimation() {
        self.layer.removeAnimation(forKey: "shake")
    }
    
}
