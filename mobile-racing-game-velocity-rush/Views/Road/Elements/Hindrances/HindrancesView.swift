//
//  HindrancesView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 13.10.23.
//

import UIKit

private enum Constants {
    static let width: CGFloat = 40
    static let height: CGFloat = 60
    static let shift: TimeInterval = 0.3
    static let duration: TimeInterval = 2.1
    
    enum Left {
        static let x: CGFloat = 25
    }
    
    enum Right {
        static let x: CGFloat = -25
    }
    
    enum Element {
        static let alpha: CGFloat = 0.8
        static let frameStartTime: Double = 0.2
        static let frameDuration: Double = 0.5
    }
}

final class HindrancesView: UIView {
    var elements: [UIView] = []
    private var type: HindranceType!
    private var size: Int!
    
    init(frame: CGRect, type: HindranceType, size: Int = 5) {
        super.init(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        self.type = type
        self.size = size
        addElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func runAnimation() {
        var delay: TimeInterval = 0.0
        for element in elements {
            animateElement(with: element, delay: delay)
            delay += Constants.shift
        }
    }
 
    func stopAnimation() {
        for element in elements {
            let pausedTime = element.layer.convertTime(CACurrentMediaTime(), from: nil)
            element.layer.speed = 0.0
            element.layer.timeOffset = pausedTime
        }
    }
    
    private func addElements() {
        var isLeft: Bool = true
        for _ in 1...size {
            
            let x = isLeft ? Constants.Left.x : frame.width + Constants.Right.x
            let frame = CGRect(
                x: x - Constants.width / 2,
                y: -Constants.height,
                width: Constants.width,
                height: Constants.height
            )
            
            let view: UIView = HindranceFactory.createHindrance(type: type, frame: frame)
            
            addSubview(view)
            elements.append(view)
            
            isLeft.toggle()
        }
    }
    
    private func animateElement(with element: UIView, delay: TimeInterval) {
        UIView.animateKeyframes(withDuration: Constants.duration, delay: delay, options: [.repeat], animations: {
            element.frame.origin.y += self.frame.height + Constants.height * 2
            UIView.addKeyframe(withRelativeStartTime: Constants.Element.frameStartTime, relativeDuration: Constants.Element.frameDuration) {
                element.alpha = Constants.Element.alpha
            }
        }, completion: nil)
    }
    
}