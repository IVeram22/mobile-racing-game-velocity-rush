//
//  GameSettingsPresenter.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 27.10.23.
//

import Foundation

final class GameSettingsPresenter {
    weak private var gameSettingsInputDelegate: GameSettingsInputDelegate?
    weak private var gameSettingsInputDataDelegate: GameSettingsInputDataDelegate?
    
    // MARK: - Public
    func setGameSettingsInputDelegate(with delegate: GameSettingsInputDelegate) {
        gameSettingsInputDelegate = delegate
    }
    func setGameSettingsInputDataDelegate(with delegate: GameSettingsInputDataDelegate) {
        gameSettingsInputDataDelegate = delegate
    }
    
    // MARK: - Private
    private func loadGameSettings() {
        gameSettingsInputDataDelegate?.setupConfig(with: GameSettingsManager.shared.getGameSettingsModel())
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
