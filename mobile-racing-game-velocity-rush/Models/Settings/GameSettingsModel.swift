//
//  GameSettingsModel.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import Foundation

final class GameSettingsModel: Codable {
    var user: UserModel
    var carColorIndex: Int
    var hindranceIndex: Int
    var levelIndex: Int
    var controlIndex: Int
        
    init(user: UserModel, carColorIndex: Int, hindranceIndex: Int, levelIndex: Int, controlIndex: Int) {
        self.user = user
        self.carColorIndex = carColorIndex
        self.hindranceIndex = hindranceIndex
        self.levelIndex = levelIndex
        self.controlIndex = controlIndex
    }

}
