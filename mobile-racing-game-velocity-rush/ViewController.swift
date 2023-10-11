//
//  ViewController.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

private enum Constants {
    enum Menu {
        static let width: CGFloat = 231
        static let height: CGFloat = 165
    }
}

class ViewController: UIViewController {
    
    private let menu: MenuView = MenuView()
    private let router: StartMenuRouter = Router.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        menu.delegate = self
        menu.frame = CGRect(x: 0, y: 0, width: Constants.Menu.width, height: Constants.Menu.height)
        
        view.addSubview(menu)
        NSLayoutConstraint.activate([
            menu.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menu.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            menu.widthAnchor.constraint(equalToConstant: Constants.Menu.width),
            menu.heightAnchor.constraint(equalToConstant: Constants.Menu.height),
        ])
        
    }
    
}

extension ViewController: ViewControllerDelegate {
    func startPlaying() {
        router.startPlaying(from: self)
    }
    
    func openSettings() {
        router.openSettings(from: self)
    }
    
    func seeRecords() {
        router.seeRecords(from: self)
    }
    
}
