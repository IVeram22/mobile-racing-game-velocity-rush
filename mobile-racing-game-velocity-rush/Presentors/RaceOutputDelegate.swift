//
//  RaceOutputDelegate.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit

protocol RaceOutputDelegate: AnyObject {
    func startCounter()
    func stopCounter()
    func getScore() -> String
    func saveRecord()
}
