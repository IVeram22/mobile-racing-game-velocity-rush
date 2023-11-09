//
//  EnemyCarsView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

private enum Constants {
    static let alpha: CGFloat = 0.7
    static let delay: CGFloat = 0.3
    static let withDuration: CGFloat = 3.5
    static let withRelativeStartTime: CGFloat = 0.2
    static let relativeDuration: CGFloat = 0.5
    static let yStep: CGFloat = 2000
    static let xRange: ClosedRange<CGFloat> = 80.1...UIScreen.main.bounds.width - 80.1
    static let yRange: ClosedRange<CGFloat> = GlobalConstants.Cars.height * 1.5...GlobalConstants.Cars.height * 5
}

final class EnemyCarsView: UIView {
    private var size: Int!
    var elements: [UIView] = []
    
    init(frame: CGRect, size: Int = 2) {
        super.init(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        self.size = size
        addCars()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    func runAnimation() {
        for element in elements {
            animateCar(with: element)
        }
    }
    
    func stopAnimation() {
        for element in elements {
            let pausedTime = element.layer.convertTime(CACurrentMediaTime(), from: nil)
            element.layer.speed = 0.0
            element.layer.timeOffset = pausedTime
        }
    }
    
    func setNewNumberOfCars(size: Int) {
        self.size = size
        elements = []
        addCars()
    }
    
    // MARK: - Private
    private func addCars() {
        for _ in 1...size {
            let car = createCar()
            if let car {
                elements.append(car)
            }
        }
    }
    
    private func createCar() -> UIView? {
        let car = addRandomCar()
        if let car {
            car.dropShadow()
            car.cornerRadius()
            addSubview(car)
        }
        return car
    }
    
    private func animateCar(with car: UIView, delay: CGFloat = Constants.delay, options: UIView.KeyframeAnimationOptions = [Bool.random() ? .autoreverse : .calculationModePaced]) {
        UIView.animateKeyframes(withDuration: Constants.withDuration, delay: delay, options: options, animations: {
            
            car.frame.origin.y += Constants.yStep
            
            UIView.addKeyframe(withRelativeStartTime: Constants.withRelativeStartTime, relativeDuration: Constants.relativeDuration) {
                car.alpha = Constants.alpha
            }
        }, completion: { [self] _ in
            removeCar(car)
            let newDelay: TimeInterval = delay + Constants.delay
            let newCar = createCar()
            if let newCar {
                elements.append(newCar)
                animateCar(with: newCar, delay: Bool.random() ? newDelay : -newDelay)
            }
        })
    }
    
    private func removeCar(_ car: UIView) {
        car.removeFromSuperview()
        if let index = elements.firstIndex(of: car) {
            elements.remove(at: index)
        }
    }
    
    private func addRandomCar() -> UIView? {
        if elements.count == size {
            return nil
        }
        
        let x: CGFloat = getX()
        let y: CGFloat = getY()
        
        return add(x: x, y: -y)
    }
    
    private func getX() -> CGFloat {
        let x: CGFloat = CGFloat.random(in: Constants.xRange)
        for element in elements {
            if element.frame.intersects(CGRect(x: x, y: element.frame.origin.y, width: element.frame.width, height: element.frame.height)) {
                return getX()
            }
        }
        return x
    }
    
    private func getY() -> CGFloat {
        let y: CGFloat = CGFloat.random(in: Constants.yRange)
        for element in elements {
            if element.frame.intersects(CGRect(x: element.frame.origin.x, y: y, width: element.frame.width, height: element.frame.height)) {
                return getY()
            }
        }
        return y
    }
    
    private func add(x: CGFloat, y: CGFloat) -> UIView {
        let car = UIImageView(frame: CGRect(
            x: x,
            y: y,
            width: GlobalConstants.Cars.width,
            height: GlobalConstants.Cars.height
        ))
        
        car.image = UIImage(named: "EnemyCar\(Int.random(in: 0...8))")
        
        return car
    }
    
}
