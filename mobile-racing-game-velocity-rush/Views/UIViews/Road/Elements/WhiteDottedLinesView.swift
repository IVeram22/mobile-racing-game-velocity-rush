//
//  WhiteDottedLinesView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

private enum Constants {
    static let width: CGFloat = 5
    static let height: CGFloat = 55
    static let backgroundColor: UIColor = .white
    static let numberOfLines: Int = 16
    
    static let duration: TimeInterval = 2.1
    static let shift: TimeInterval = 0.3
    static let alpha: CGFloat = 0.7
    static let frameStartTime: Double = 0.2
    static let frameDuration: Double = 0.5

}

final class WhiteDottedLinesView: UIView {
    private var lines: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        addLines()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    func runAnimation() {
        var delay: TimeInterval = 0.0
        for line in lines {
            animateWhiteDottedLine(with: line, delay: delay)
            delay += Constants.shift
        }
    }
 
    func stopAnimation() {
        for whiteDottedLine in lines {
            let pausedTime = whiteDottedLine.layer.convertTime(CACurrentMediaTime(), from: nil)
            whiteDottedLine.layer.speed = 0.0
            whiteDottedLine.layer.timeOffset = pausedTime
        }
    }
    
    // MARK: - Private
    private func addLines() {
        for _ in 0...Constants.numberOfLines {
            lines.append(createLine())
        }
    }
    
    private func animateWhiteDottedLine(with line: UIView, delay: TimeInterval) {
        UIView.animateKeyframes(withDuration: Constants.duration, delay: delay, options: [.repeat], animations: {
            line.frame.origin.y += self.frame.height + Constants.height * 2
            UIView.addKeyframe(withRelativeStartTime: Constants.frameStartTime, relativeDuration: Constants.frameDuration) {
                line.alpha = Constants.alpha
            }
        }, completion: nil)
    }
    
    private func createLine() -> UIView {
        let newLine = UIView(frame: CGRect(
            x: frame.width / 2 - Constants.width / 2,
            y: -Constants.height,
            width: Constants.width,
            height: Constants.height
        ))
        
        newLine.backgroundColor = Constants.backgroundColor
        
        addSubview(newLine)
        return newLine
    }
    
    private func removeLine(_ line: UIView) {
        line.removeFromSuperview()
        if let index = lines.firstIndex(of: line) {
            lines.remove(at: index)
        }
    }
    
}
