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
    // MARK: Interface
    private var menu: StartMenuView!
    private var road: RoadView!
    // MARK: Navigation
    private let router: StartMenuRouter = Router.shared
    // MARK: Presenter
    private var config: GameSettingsModel!
    private let presenter = GameSettingsPresenter()
    weak private var gameSettingsOutputDelegate: GameSettingsOutputDelegate?
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        setupInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBeforeAppearance()
    }
    
    // MARK: - Private
    private func setupPresenter() {
        presenter.setGameSettingsInputDelegate(with: self)
        presenter.setGameSettingsInputDataDelegate(with: self)
        gameSettingsOutputDelegate = presenter
    }
    
    private func setupInterface() {
        addRoad()
        view.addBlackBackground()
        addStartMenu()
    }
    
    private func setupBeforeAppearance() {
        gameSettingsOutputDelegate?.getConfig()
        road.runAllAnimation()
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
        menu.setViewControllerDelegate(with: self)
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

extension ViewController: GameSettingsInputDataDelegate {
    func setupConfig(with gameSettings: GameSettingsModel) {
        config = gameSettings
    }
    
}

extension ViewController: GameSettingsInputDelegate {
    func setupInitialState() {
        displayData()
    }
    
    func displayData() {
        road.setHindrances(index: config.hindranceIndex)
    }
    
}
