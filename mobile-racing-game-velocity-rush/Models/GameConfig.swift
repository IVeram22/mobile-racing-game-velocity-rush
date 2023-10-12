//
//  GameConfig.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

final class GameConfig {
    var user: User
    var carColor: Int
    var hindrance: Int
    var difficulty: String
    var control: String
    
    init(user: User, carColor: Int, hindrance: Int, difficulty: String, control: String) {
        self.user = user
        self.carColor = carColor
        self.hindrance = hindrance
        self.difficulty = difficulty
        self.control = control
    }
}

final class User {
    var name: String
    var foto: UIImage
    
    init(name: String, foto: UIImage) {
        self.name = name
        self.foto = foto
    }
}

enum Control {
    case 
}
