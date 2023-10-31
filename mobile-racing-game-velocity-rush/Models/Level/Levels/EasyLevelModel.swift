//
//  EasyLevelModel.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 28.10.23.
//

import Foundation

private enum Constants {
    static let name: String = "Easy"
    static let numberOfCars: Int = 2
    static let numberOfHindrances: Int = 0
    
}

final class EasyLevelModel: BaseLevelModel {
    init() {
        super.init(
            name: Constants.name,
            numberOfCars: Constants.numberOfCars,
            numberOfHindrances: Constants.numberOfHindrances
        )
    }
    
}
