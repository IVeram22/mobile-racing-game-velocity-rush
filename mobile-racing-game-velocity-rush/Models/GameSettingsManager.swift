//
//  GameSettingsManager.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import Foundation

private enum Constants {
    static let forKey: String = "GameSettingsModelKey"
    static let defaultName: String = "Unknown"
    
}

// MARK: Singleton - GameSettingsManager class is designed to work with game settings
final class GameSettingsManager {
    static let shared = GameSettingsManager()
    
    private init() {}

    // MARK: - Public
    func getGameSettingsModel() -> GameSettingsModel {
        read() ?? GameSettingsModel(
            user: UserModel(name: Constants.defaultName, foto: nil),
            carColorIndex: 0,
            hindranceIndex: 0,
            levelIndex: 0,
            controlIndex: 0
        )
    }
    
    func setGameSettingsModel(with gameSettings: GameSettingsModel) {
        save(with: gameSettings)
    }
    
    // MARK: - Private
    private func save(with gameSettings: GameSettingsModel) {
        UserDefaults.standard.set(encodable: gameSettings, forKey: Constants.forKey)
    }
    
    private func read() -> GameSettingsModel? {
        UserDefaults.standard.object(GameSettingsModel.self, forKey: Constants.forKey)
    }
    
}
