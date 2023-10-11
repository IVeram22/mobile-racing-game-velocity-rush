//
//  Router.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import Foundation

final class Router {
    static let shared = Router()
    
    private init() {}
    
    private func open(from viewController: ViewController, to nextViewController: ViewController) {
        nextViewController.modalPresentationStyle = .fullScreen
        viewController.present(nextViewController, animated: false)
    }
}

extension Router: StartMenuRouter {
    func startPlaying(from viewController: ViewController) {
        print(#function)
    }
    
    func openSettings(from viewController: ViewController) {
        print(#function)
    }
    
    func seeRecords(from viewController: ViewController) {
        print(#function)
    }
    
}
