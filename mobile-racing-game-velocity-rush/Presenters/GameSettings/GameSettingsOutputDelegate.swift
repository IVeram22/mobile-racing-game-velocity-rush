//
//  GameSettingsOutputDelegate.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 28.10.23.
//

import Foundation

protocol GameSettingsOutputDelegate: AnyObject {
    func getConfig()
    func setConfig(with gameSettings: GameSettingsModel)
}
