//
//  StartPresentor.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import Foundation

final class StartPresentor {
    weak private var startInputDelegate: StartInputDelegate?
    
    func setStartInputDelegate(delegate: StartInputDelegate?) {
        startInputDelegate = delegate
    }
    
    private func loadTestData() {
        startInputDelegate?.setupData(with: GameSettingsManager.shared.getGameSettingsModel())
        startInputDelegate?.displayData()
    }
    
}

// MARK: - Extensions
extension StartPresentor: StartOutputDelegate {
    func getData() {
        loadTestData()
    }

}
