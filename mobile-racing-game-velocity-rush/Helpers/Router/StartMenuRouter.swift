//
//  StartMenuRouter.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

protocol StartMenuRouter {
    func startPlaying(from viewController: UIViewController)
    func openSettings(from viewController: UIViewController)
    func seeRecords(from viewController: UIViewController)
}
