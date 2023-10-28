//
//  CounterOutputDelegate.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 28.10.23.
//

import Foundation

protocol CounterOutputDelegate: AnyObject {
    func getScore() -> String
    func start()
    func stop()
}
