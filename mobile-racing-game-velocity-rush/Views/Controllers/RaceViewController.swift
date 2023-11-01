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
    // MARK: Interface
    private var road: RoadView!
    private var player: PlayerCarView!
    private var control: BaseControlView!
    private var counter: UILabel!
    private var roadTimer: Timer!
    // MARK: Navigation
    private let router: GameOverRouter = Router.shared
    // MARK: Presenter
    private var config: GameSettingsModel!
    private let gameSettingsPresenter = GameSettingsPresenter()
    weak private var gameSettingsOutputDelegate: GameSettingsOutputDelegate?
    private let recordsPresenter = RecordsPresenter()
    weak private var recordsOutputDelegate: RecordsOutputDelegate?
    private let counterPresenter = CounterPresenter()
    weak private var counterOutputDelegate: CounterOutputDelegate?
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenters()
        setupInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBeforeAppearance()
    }
    
    // MARK: - Private
    private func setupPresenters() {
        gameSettingsPresenter.setGameSettingsInputDataDelegate(with: self)
        gameSettingsOutputDelegate = gameSettingsPresenter
        recordsOutputDelegate = recordsPresenter
        counterOutputDelegate = counterPresenter
        gameSettingsOutputDelegate?.getConfig()
    }
    
    private func setupInterface() {
        addRoad()
        addCounter()
        addPlayer()
        addControl()
    }
    
    private func setupBeforeAppearance() {
        road.setHindrances(index: config.hindranceIndex)
        road.setLevel(with: config.levelIndex)
        road.runLinesAnimation()
        
        if let accelerometerControl = control as? AccelerometerControlView {
            accelerometerControl.startTimer()
        }
        
        
        Timer.scheduledTimer(withTimeInterval: Constants.pauseIntervalBeforeGame, repeats: false) { [self] _ in
            road.runCarsAnimation()
            road.runHindrancesAnimation()
            counterOutputDelegate?.start()
        }
        
        roadTimer = Timer.scheduledTimer(withTimeInterval: Constants.checkCollisionInterval, repeats: true) { [self] _ in
            checkCollision()
            updateCounter()
        }
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
        ), with: config.carColorIndex)
        view.addSubview(player)
    }
    
    private func addControl() {
        control = ControlFactory.createControl(index: config.controlIndex, frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        ))
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
        counter.text = "\(getScore()) \("points".localized)"
    }
    
    private func stopEverything() {
        if let accelerometerControl = control as? AccelerometerControlView {
            accelerometerControl.stopTimer()
        }
        roadTimer?.invalidate()
        roadTimer = nil
        counterOutputDelegate?.stop()
        road.stopAllAnimation()
        view.addBlackBackground()
    }
    
    private func openAlert() {
        recordsOutputDelegate?.addNewRecord(with: RecordModel(user: config.user, points: getScore(), color: config.levelIndex))
        
        let alert = UIAlertController(
            title: "Game Over".localized,
            message: "\("You have scored".localized) \(getScore()) \("points".localized)!",
            preferredStyle: .alert
        )
        
        let restartAction = UIAlertAction(title: "Restart".localized, style: .default) { [self] _ in
            router.restartGame(from: self)
        }
        alert.addAction(restartAction)
        
        let cancelAction = UIAlertAction(title: "Cancel".localized, style: .cancel) { [self] _ in
            router.comeBack(from: self)
        }
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func getScore() -> String {
        counterOutputDelegate?.getScore() ?? "nil"
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

extension RaceViewController: GameSettingsInputDataDelegate {
    func setupConfig(with gameSettings: GameSettingsModel) {
        config = gameSettings
    }
    
}
