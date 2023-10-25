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
    
    init(user: UserModel, points: String) {
        self.user = user
        self.points = points
        self.date = DateManager.shared.getCurrentDate()
    }
    
}
