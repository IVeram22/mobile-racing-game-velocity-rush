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
    private var control: ButtonsControlView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoad()
        addPlayer()
        addControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        road.runLinesAnimation()
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [self] _ in
            road.runCarsAnimation()
        }
    }
    
    private func addRoad() {
        road = RoadView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(road)
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
    
}

extension RaceViewController: ControlRacerDelegate {
    func turnLeft() {
        player.moveToLeft()
    }
    
    func turnRight() {
        player.moveToRight()
    }
    
}
