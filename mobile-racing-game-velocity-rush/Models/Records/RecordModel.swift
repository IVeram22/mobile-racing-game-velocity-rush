//
//  RecordModel.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import Foundation

final class RecordModel: Codable {
    var user: UserModel
    var points: String
    var date: String
    var color: Int
    
    init(user: UserModel, points: String, color: Int) {
        self.user = user
        self.points = points
        self.date = DateManager.shared.getCurrentDate()
        self.color = color
    }
    
}

// MARK: - Extensions
extension [RecordModel] {
    mutating func sortedByPoints() {
        self.sort { currentRecord, nextRecord in
            if let currentPoint = Int(currentRecord.points),
               let nextPoint = Int(nextRecord.points) {
                return currentPoint > nextPoint
            }
            return false
        }
    }
    
    mutating func sortedByLevel() {
        self.sort { currentRecord, nextRecord in
            currentRecord.color > nextRecord.color
        }
    }
}
