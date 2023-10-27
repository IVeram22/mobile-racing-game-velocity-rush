//
//  CounterPresenter.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 27.10.23.
//

import Foundation

final class CounterPresenter {
    private var counter = CounterModel()
}

// MARK: - Get
protocol CounterOutputDelegate: AnyObject {
    func getScore() -> String
    func start()
    func stop()
}

// MARK: - Extensions
extension CounterPresenter: CounterOutputDelegate {
    func getScore() -> String {
        String(describing: counter.getScore())
    }
    
    func start() {
        counter.start()
    }
    
    func stop() {
        counter.stop()
    }
    
}
