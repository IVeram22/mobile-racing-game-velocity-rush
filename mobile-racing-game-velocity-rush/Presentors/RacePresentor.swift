//
//  RacePresentor.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit

final class RacePresentor {
    private var counter: Double = 0
    private let step = 0.1
    
}

extension RacePresentor: RaceOutputDelegate {
    func getCounter() -> String {
        counter += step
        return String(format: "%.1f", counter)
    }
    
    func saveRecord() {
        
    }
}
