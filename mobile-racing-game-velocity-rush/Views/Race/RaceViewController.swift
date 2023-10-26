//
//  RaceViewController.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

private enum Constants {
    static let pauseIntervalBeforeGame: TimeInterval = 3.0
    static let checkCollisionInterval: TimeInterval = 0.1
    
    enum Counter {
        static let fontSize: CGFloat = 21
        static let topAnchor: CGFloat = 75
        static let heightAnchor: CGFloat = 35
    }
    
    enum PlayerCar {
        static let x: CGFloat = 2
        static let y: CGFloat = 1.5
        static let half: CGFloat = 2
    }
    
}

class RaceViewController: UIViewController {
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoad()
        addCounter()
        addPlayer()
        addControl()
        raceOutputDelegate = presenter
    }
    
    override func viewWillAppear(_ animated: Bool) {
        road.setHindrances(index: gameSettings.hindranceIndex)
        road.runLinesAnimation()
        Timer.scheduledTimer(withTimeInterval: Constants.pauseIntervalBeforeGame, repeats: false) { [self] _ in
            road.runCarsAnimation()
            road.runHindrancesAnimation()
            raceOutputDelegate?.startCounter()
        }
        roadTimer = Timer.scheduledTimer(withTimeInterval: Constants.checkCollisionInterval, repeats: true) { [self] _ in
            checkCollision()
            updateCounter()
        }
    }
    
    // MARK: - Private
    private var road: RoadView!
    private var player: PlayerCarView!
    private var control: BaseControlView!
    private var counter: UILabel!
    private var roadTimer: Timer!
    private let router: GameOverRouter = Router.shared
    
    private var gameSettings: GameSettingsModel = GameSettingsManager.shared.getGameSettingsModel()
    private let presenter = RacePresentor()
    weak private var raceOutputDelegate: RaceOutputDelegate?
    
    private func addRoad() {
        road = RoadView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(road)
    }
    
    private func addCounter() {
        counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.font = UIFont.systemFont(ofSize: Constants.Counter.fontSize)
        counter.textColor = .white
        
        view.addSubview(counter)
        NSLayoutConstraint.activate([
            counter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counter.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.Counter.topAnchor),
            counter.heightAnchor.constraint(equalToConstant: Constants.Counter.heightAnchor),
        ])
        
    }
    
    private func addPlayer() {
        player = PlayerCarView(frame: CGRect(
            x: view.frame.width / Constants.PlayerCar.x - GlobalConstants.Cars.width / Constants.PlayerCar.half,
            y: view.frame.height / Constants.PlayerCar.y - GlobalConstants.Cars.height / Constants.PlayerCar.half,
            width: GlobalConstants.Cars.width,
            height: GlobalConstants.Cars.height
        ), with: gameSettings.carColorIndex)
        view.addSubview(player)
    }
    
    private func addControl() {
        control = ButtonsControlView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        control.delegate = self
        view.addSubview(control)
    }
    
    private func checkCollision() {
        checkCollision(with: road.getEnemyCars())
        checkCollision(with: road.getHindrances())
    }
    
    private func checkCollision(with elements: [UIView]) {
        for element in elements {
            let elementPresentation = element.layer.presentation()
            let racerPresentation = player.layer.presentation()

            if let elementFrame = elementPresentation?.frame, let racerFrame = racerPresentation?.frame {
                if racerFrame.intersects(elementFrame) {
                    gameOver()
                }
            }
        }
    }
    
    private func updateCounter() {
        if let raceOutputDelegate {
            counter.text = "\(raceOutputDelegate.getScore()) points"
        }
    }
    
    private func stopEverything() {
        roadTimer?.invalidate()
        roadTimer = nil
        raceOutputDelegate?.stopCounter()
        road.stopAllAnimation()
        view.addBlackBackground()
    }
    
    private func openAlert() {
        guard let raceOutputDelegate = raceOutputDelegate else { return }
        raceOutputDelegate.saveRecord()
        
        let alert = UIAlertController(
            title: "Game Over",
            message: "You have scored \(raceOutputDelegate.getScore()) points!",
            preferredStyle: .alert
        )
        
        let restartAction = UIAlertAction(title: "Restart", style: .default) { [self] _ in
            raceOutputDelegate.saveRecord()
            router.restartGame(from: self)
        }
        alert.addAction(restartAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { [self] _ in
            raceOutputDelegate.saveRecord()
            router.comeBack(from: self)
        }
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func gameOver() {
        stopEverything()
        openAlert()
    }

}

// MARK: - Extensions
extension RaceViewController: ControlRacerDelegate {
    func turnLeft() {
        player.moveToLeft()
    }
    
    func turnRight() {
        player.moveToRight()
    }
    
}
