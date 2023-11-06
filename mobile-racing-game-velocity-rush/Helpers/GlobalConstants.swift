//
//  GlobalConstants.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

enum GlobalConstants {
    enum Cars {
        static let width: CGFloat = 40
        static let height: CGFloat = 75
        static let colors: [UIImage?] = [
            UIImage(named: "PlayerCar0"),
            UIImage(named: "PlayerCar1"),
            UIImage(named: "PlayerCar2"),
            UIImage(named: "PlayerCar3"),
            UIImage(named: "PlayerCar4"),
        ]
    }
    
    enum Hindrances {
        static let width: CGFloat = 40
        static let height: CGFloat = 60
    }
    
    enum Levels {
        static let width: CGFloat = 155
        static let height: CGFloat = 75
        static let names: [String] = [ "Easy", "Normal", "Hard"]
        static let colors: [UIColor] = [ .green, .yellow, .red]
    }
    
    enum Controls {
        static let width: CGFloat = 155
        static let height: CGFloat = 75
        static let names: [String] = [ "Tap", "Swipe", "Accelerometer"]
        static let colors: [UIColor] = [ .systemCyan, .systemMint, .systemPink]
    }
    
    enum BackButton {
        static let width: CGFloat = 121
        static let height: CGFloat = 35
    }

}
