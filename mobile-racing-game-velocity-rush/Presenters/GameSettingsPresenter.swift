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
    
    private func loadGameSettingsData() {
        gameSettingsInputDelegate?.setupData(with: GameSettingsManager.shared.getGameSettingsModel())
        gameSettingsInputDelegate?.setupInitialState()
    }
    
}

// MARK: - Set
protocol GameSettingsInputDelegate: AnyObject {
    func setupInitialState()
    func setupData(with gameSettings: GameSettingsModel)
    func displayData()
}

// MARK: - Get
protocol GameSettingsOutputDelegate: AnyObject {
    func getData()
    func setData(with gameSettings: GameSettingsModel)
}

// MARK: - Extensions
extension GameSettingsPresenter: GameSettingsOutputDelegate {
    func getData() {
        loadGameSettingsData()
    }
    
    func setData(with gameSettings: GameSettingsModel) {
        GameSettingsManager.shared.setGameSettingsModel(with: gameSettings)
    }
    
}
