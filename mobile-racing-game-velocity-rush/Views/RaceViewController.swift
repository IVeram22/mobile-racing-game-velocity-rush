//
//  RaceViewController.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

class RaceViewController: UIViewController {
    private var road: RoadView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        road = RoadView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(road)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        road.runLinesAnimation()
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [self] _ in
            road.runCarsAnimation()
        }
    }
    
}
