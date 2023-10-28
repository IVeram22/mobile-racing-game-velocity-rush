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
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        addRoad()
        view.addBlackBackground()
        addStartMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gameSettingsOutputDelegate?.getConfig()
        road.runAllAnimation()
    }
    
    // MARK: - Private
    private var menu: StartMenuView!
    private var road: RoadView!
    // Navigation
    private let router: StartMenuRouter = Router.shared
    // Presenter
    private var config: GameSettingsModel!
    private let presenter = GameSettingsPresenter()
    weak private var gameSettingsOutputDelegate: GameSettingsOutputDelegate?
    
    private func setupPresenter() {
        presenter.setGameSettingsInputDelegate(with: self)
        gameSettingsOutputDelegate = presenter
    }
    
    private func addRoad() {
        road = RoadView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        ))
        view.addSubview(road)
    }
    
    private func addStartMenu() {
        menu = StartMenuView(frame: CGRect(
            x: 0,
            y: 0,
            width: Constants.Menu.width,
            height: Constants.Menu.height
        ))
        menu.delegate = self
        view.addSubview(menu)
        NSLayoutConstraint.activate([
            menu.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menu.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            menu.widthAnchor.constraint(equalToConstant: Constants.Menu.width),
            menu.heightAnchor.constraint(equalToConstant: Constants.Menu.height),
        ])
    }
}

// MARK: - Extensions
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

extension ViewController: GameSettingsInputDelegate {
    func setupInitialState() {
        displayData()
    }
    
    func setupConfig(with gameSettings: GameSettingsModel) {
        config = gameSettings
    }
    
    func displayData() {
        road.setHindrances(index: config.hindranceIndex)
    }
    
}
