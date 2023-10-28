//
//  BaseLevelModel.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 28.10.23.
//

import Foundation

class BaseLevelModel {
    init(name: String, numberOfCars: Int, numberOfHindrances: Int) {
        self.name = name
        self.numberOfCars = numberOfCars
        self.numberOfHindrances = numberOfHindrances
    }
    
    // MARK: - Private
    private let name: String
    private let numberOfCars: Int
    private let numberOfHindrances: Int
    
    // MARK: - Public
    func getNumberOfCars() -> Int {
        numberOfCars
    }
    
    func getNumberOfHindrances() -> Int {
        numberOfHindrances
    }
    
}
