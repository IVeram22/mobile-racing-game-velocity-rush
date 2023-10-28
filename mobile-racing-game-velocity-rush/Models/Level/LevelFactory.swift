//
//  LevelFactory.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 28.10.23.
//

import Foundation

enum LevelType {
    case easy
    case normal
    case hard
    
}

final class LevelFactory  {
    static func createLevel(type: LevelType) -> BaseLevelModel {
        switch type {
        case .normal:
            return NormalLevelModel()
        case .hard:
            return HardLevelModel()
        default:
            return EasyLevelModel()
        }
    }
    
    static func createLevel(index: Int) -> BaseLevelModel {
        switch index {
        case 1:
            return NormalLevelModel()
        case 2:
            return HardLevelModel()
        default:
            return EasyLevelModel()
        }
    }
}
