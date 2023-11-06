//
//  Router.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

private enum Constants {
    static let duration: CFTimeInterval = 0.3
    
}

final class Router {
    static let shared = Router()
    
    // MARK: - Private
    private init() {}
    
    private func open(from viewController: UIViewController, to nextViewController: UIViewController, type: CATransitionType, subtype: CATransitionSubtype) {
        nextViewController.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = Constants.duration
        transition.type = type
        transition.subtype = subtype
        viewController.view.window?.layer.add(transition, forKey: kCATransition)
        
        viewController.present(nextViewController, animated: false)
    }
}

// MARK: - Extensions
extension Router: MainRouter {
    func openMainScreen(from viewController: UIViewController) {
        open(
            from: viewController,
            to: MainViewController(),
            type: .fade,
            subtype: .fromBottom)
    }
    
}

extension Router: StartMenuRouter {
    func startPlaying(from viewController: UIViewController) {
        open(
            from: viewController,
            to: RaceViewController(),
            type: .moveIn,
            subtype: .fromRight)
    }
    
    func openSettings(from viewController: UIViewController) {
        open(
            from: viewController,
            to: SettingsViewController(),
            type: .moveIn,
            subtype: .fromRight)
    }
    
    func seeRecords(from viewController: UIViewController) {
        open(
            from: viewController,
            to: RecordsViewController(),
            type: .moveIn,
            subtype: .fromRight)
    }
    
}

extension Router: GameOverRouter {
    func restartGame(from viewController: UIViewController) {
        open(
            from: viewController,
            to: RaceViewController(),
            type: .moveIn,
            subtype: .fromBottom)
    }
    
}

extension Router: BackRouter {
    func comeBack(from viewController: UIViewController) {
        open(
            from: viewController,
            to: MainViewController(),
            type: .reveal,
            subtype: .fromLeft)
    }
    
}
