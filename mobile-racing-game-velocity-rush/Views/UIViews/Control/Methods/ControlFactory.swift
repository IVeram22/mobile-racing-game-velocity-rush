//
//  ControlFactory.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 27.10.23.
//

import Foundation

enum ControlType {
    case Tap
    case Swipe
    case Accelerometer
}

final class ControlFactory {
    static func createControl(type: ControlType, frame: CGRect) -> BaseControlView {
        switch type {
        case .Tap:
            return ButtonsControlView(frame: frame)
        case .Swipe:
            return SwipesControlView(frame: frame)
        case .Accelerometer:
            return AccelerometerControlView(frame: frame)
        }
    }
    
    static func createControl(index: Int, frame: CGRect) -> BaseControlView {
        createControl(type: getElementByIndex(with: index), frame: frame)
    }
    
    static func getSize() -> Int {
        3
    }
    
    static func getElementByIndex(with index: Int) -> ControlType {
        switch index {
        case 0:
            return .Tap
        case 1:
            return .Swipe
        case 2:
            return .Accelerometer
        default:
            return .Tap
        }
    }
}
