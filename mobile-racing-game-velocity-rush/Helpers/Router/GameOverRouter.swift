//
//  GameOverRouter.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 13.10.23.
//

import UIKit

protocol GameOverRouter {
    func restartGame(from viewController: UIViewController)
    func comeBack(from viewController: UIViewController)
}
