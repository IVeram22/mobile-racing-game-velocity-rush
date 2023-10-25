//
//  RacePresentor.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit

final class RacePresentor {
    private let counter: CounterModel = CounterModel()
    
}

extension RacePresentor: RaceOutputDelegate {
    func startCounter() {
        counter.start()
    }
    
    func stopCounter() {
        counter.stop()
    }
    
    func getScore() -> String {
        return String(format: "%.1f", counter.getScore())
    }
    
    func saveRecord() {
        let record = RecordModel(
            user: GameSettingsManager.shared.getGameSettingsModel().user,
            points: getScore()
        )
        RecordsManager.shared.addRecord(with: record)
    }
    
}
