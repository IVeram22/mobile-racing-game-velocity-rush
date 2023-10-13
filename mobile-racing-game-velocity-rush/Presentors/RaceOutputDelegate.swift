//
//  RaceOutputDelegate.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import Foundation

protocol RaceOutputDelegate: AnyObject {
    func getCounter() -> String
    func saveRecord()
}
