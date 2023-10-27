//
//  CounterModel.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 13.10.23.
//

import UIKit

private enum Constants {
    static let interval: TimeInterval = 1.0
    static let shift: Double = 0.5
}

final class CounterModel {
    private var counter: Double = 0.0
    private var timer: Timer?
    
    init() { }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: Constants.interval, repeats: true) { [self] _ in
            counter += Constants.shift
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func getScore() -> Double {
        counter
    }
    
}
