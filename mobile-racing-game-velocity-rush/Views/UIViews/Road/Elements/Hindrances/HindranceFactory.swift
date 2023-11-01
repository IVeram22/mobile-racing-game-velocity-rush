//
//  HindrancesView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 13.10.23.
//

import UIKit

enum HindranceType {
    case SpringTree
    case SummerTree
    case AutumnTree
    case WinterTree

}

final class HindranceFactory {
    static func createHindrance(type: HindranceType, frame: CGRect) -> BaseHindranceView {
        switch type {
        case .SpringTree:
            return SpringTreeHindranceView(frame: frame)
        case .SummerTree:
            return SummerTreeHindranceView(frame: frame)
        case .AutumnTree:
            return AutumnTreeHindranceView(frame: frame)
        case .WinterTree:
            return WinterTreeHindranceView(frame: frame)
        }
    }
    
    static func getSize() -> Int {
        4
    }
    
    static func getElementByIndex(with index: Int) -> HindranceType {
        switch index {
        case 0:
            return .SpringTree
        case 1:
            return .SummerTree
        case 2:
            return .AutumnTree
        default:
            return .WinterTree
        }
    }

}




