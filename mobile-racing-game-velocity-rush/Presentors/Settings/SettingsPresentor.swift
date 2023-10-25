//
//  SettingsPresentor.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import UIKit

final class SettingsPresentor {
    weak private var settingsInputDelegate: SettingsInputDelegate?
    
    func setSettingsInputDelegate(delegate: SettingsInputDelegate?) {
        settingsInputDelegate = delegate
    }
    
    private func loadTestData() {
        settingsInputDelegate?.setupData(with: GameSettingsManager.shared.getGameSettingsModel())
        settingsInputDelegate?.displayData()
    }
    
}

// MARK: - Extensions
extension SettingsPresentor: SettingsOutputDelegate {
    func getData() {
        loadTestData()
    }
    
    func setData(with data: GameSettingsModel) {
        GameSettingsManager.shared.setGameSettingsModel(with: data)
    }

}
