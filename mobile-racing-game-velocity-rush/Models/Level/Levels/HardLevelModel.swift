//
//  HardLevelModel.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 28.10.23.
//

import Foundation

private enum Constants {
    static let name: String = "Hard"
    static let numberOfCars: Int = 3
    static let numberOfHindrances: Int = 5
    
}

final class HardLevelModel: BaseLevelModel {
    init() {
        super.init(
            name: Constants.name,
            numberOfCars: Constants.numberOfCars,
            numberOfHindrances: Constants.numberOfHindrances
        )
    }
    
}
