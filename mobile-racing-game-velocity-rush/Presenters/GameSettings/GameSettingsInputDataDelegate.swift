//
//  GameSettingsInputDataDelegate.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 1.11.23.
//

import Foundation

protocol GameSettingsInputDataDelegate: AnyObject {
    func setupConfig(with gameSettings: GameSettingsModel)
}
