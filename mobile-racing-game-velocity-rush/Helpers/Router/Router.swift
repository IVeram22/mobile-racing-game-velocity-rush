//
//  Router.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

final class Router {
    static let shared = Router()
    
    private init() {}
    
    private func open(from viewController: UIViewController, to nextViewController: UIViewController) {
        nextViewController.modalPresentationStyle = .fullScreen
        viewController.present(nextViewController, animated: false)
    }
}

extension Router: StartMenuRouter {
    func startPlaying(from viewController: UIViewController) {
        open(from: viewController, to: RaceViewController())
    }
    
    func openSettings(from viewController: UIViewController) {
        open(from: viewController, to: SettingsViewController())
    }
    
    func seeRecords(from viewController: UIViewController) {
        print(#function)
    }
    
}

extension Router: GameOverRouter {
    func restartGame(from viewController: UIViewController) {
        open(from: viewController, to: RaceViewController())
    }
    
}

extension Router: BackRouter {
    func comeBack(from viewController: UIViewController) {
        open(from: viewController, to: ViewController())
    }
    
}
