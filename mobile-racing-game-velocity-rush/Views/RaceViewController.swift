//
//  RaceViewController.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

class RaceViewController: UIViewController {
    private var road: RoadView!
    private var player: PlayerCarView!
    private var control: BaseControlView!
    private var counter: UILabel!
    private var roadTimer: Timer!
    private var counterTimer: Timer!
    private let router: GameOverRouter = Router.shared
    
    private let presenter = RacePresentor()
    weak private var raceOutputDelegate: RaceOutputDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoad()
        addCounter()
        addPlayer()
        addControl()
        raceOutputDelegate = presenter
    }
    
    override func viewWillAppear(_ animated: Bool) {
        road.runLinesAnimation()
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [self] _ in
            road.runCarsAnimation()
        }
        roadTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] _ in
            checkCollision()
        }
        counterTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            updateCounter()
        }
    }
    
    private func addRoad() {
        road = RoadView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(road)
    }
    
    private func addCounter() {
        counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.font = UIFont.systemFont(ofSize: 21)
        counter.textColor = .white
        counter.text = "0.0 points"
        
        view.addSubview(counter)
        NSLayoutConstraint.activate([
            counter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counter.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            counter.heightAnchor.constraint(equalToConstant: 35),
        ])
        
    }
    
    private func addPlayer() {
        player = PlayerCarView(frame: CGRect(
            x: view.frame.width / 2 - GlobalConstants.Car.width / 2,
            y: view.frame.height / 1.5 - GlobalConstants.Car.height / 2,
            width: GlobalConstants.Car.width,
            height: GlobalConstants.Car.height
        ))
        view.addSubview(player)
    }
    
    private func addControl() {
        control = ButtonsControlView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        control.delegate = self
        view.addSubview(control)
    }
    
    private func checkCollision() {
        checkCollision(with: road.getEnemyCars())
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
            counter.text = "\(raceOutputDelegate.getCounter()) points"
        }
    }
    
    private func gameOver() {
        roadTimer?.invalidate()
        roadTimer = nil
        counterTimer?.invalidate()
        counterTimer = nil
        road.stopAllAnimation()
        view.addBlackBackground()
        
        guard let raceOutputDelegate = raceOutputDelegate else { return }
        let alert = UIAlertController(title: "Game Over", message: "You have scored \(raceOutputDelegate.getCounter()) points!", preferredStyle: .alert)
        
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

}

extension RaceViewController: ControlRacerDelegate {
    func turnLeft() {
        player.moveToLeft()
    }
    
    func turnRight() {
        player.moveToRight()
    }
    
}
