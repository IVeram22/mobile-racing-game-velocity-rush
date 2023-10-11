//
//  StartMenuRouter.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

protocol StartMenuRouter {
    func startPlaying(from viewController: ViewController)
    func openSettings(from viewController: ViewController)
    func seeRecords(from viewController: ViewController)
}
