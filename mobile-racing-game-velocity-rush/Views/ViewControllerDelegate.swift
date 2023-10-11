//
//  ViewControllerDelegate.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func startPlaying()
    func openSettings()
    func seeRecords()
}
