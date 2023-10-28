//
//  GameSettingsPresenter.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 27.10.23.
//

import Foundation

final class GameSettingsPresenter {
    weak private var gameSettingsInputDelegate: GameSettingsInputDelegate?
    
    func setGameSettingsInputDelegate(with delegate: GameSettingsInputDelegate) {
        gameSettingsInputDelegate = delegate
    }
    
    private func loadGameSettings() {
        gameSettingsInputDelegate?.setupConfig(with: GameSettingsManager.shared.getGameSettingsModel())
        gameSettingsInputDelegate?.setupInitialState()
    }
    
}

// MARK: - Extensions
extension GameSettingsPresenter: GameSettingsOutputDelegate {
    func getConfig() {
        loadGameSettings()
    }
    
    func setConfig(with gameSettings: GameSettingsModel) {
        GameSettingsManager.shared.setGameSettingsModel(with: gameSettings)
    }
    
}
