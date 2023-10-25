//
//  SettingsInputDelegate.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import Foundation

protocol SettingsInputDelegate: AnyObject {
    func setupInitialState()
    func setupData(with data: GameSettingsModel)
    func displayData()
}
