//
//  RoadView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

private enum Constants {
    static let backgroundColor: UIColor = .systemGray2
    
    enum Roadside {
        static let backgroundColor: UIColor = .systemBrown
        static let width: CGFloat = 51.5
    }
    
}

final class RoadView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Constants.backgroundColor
        
        lines = WhiteDottedLinesView(frame: frame)
        cars = EnemyCarsView(frame: frame, size: 2)
        hindrances = HindrancesView(frame: frame, type: .SummerTree, size: 5)
        
        addSubview(leftRoadside)
        addSubview(rightRoadside)
        addSubview(lines)
        addSubview(cars)
        addSubview(hindrances)
        
        NSLayoutConstraint.activate([
            leftRoadside.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            leftRoadside.heightAnchor.constraint(equalTo: heightAnchor),
            leftRoadside.widthAnchor.constraint(equalToConstant: Constants.Roadside.width),
            
            rightRoadside.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            rightRoadside.heightAnchor.constraint(equalTo: heightAnchor),
            rightRoadside.widthAnchor.constraint(equalToConstant: Constants.Roadside.width)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    func runAllAnimation() {
        lines.runAnimation()
        cars.runAnimation()
        hindrances.runAnimation()
    }
    
    func stopAllAnimation() {
        lines.stopAnimation()
        cars.stopAnimation()
        hindrances.stopAnimation()
    }
    
    func runLinesAnimation() {
        lines.runAnimation()
    }
    
    func runCarsAnimation() {
        cars.runAnimation()
    }
    
    func runHindrancesAnimation() {
        hindrances.runAnimation()
    }

    func getEnemyCars() -> [UIView] {
        cars.elements
    }

    func getHindrances() -> [UIView] {
        hindrances.elements
    }
    
    func setHindrances(index: Int) {
        hindranceType = HindranceFactory.getElementByIndex(with: index)
        addHindrances(size: 5)
    }
    
    func setLevel(with index: Int) {
        let level = LevelFactory.createLevel(index: index)
        addHindrances(size: level.getNumberOfHindrances())
        cars.setNewNumberOfCars(size: level.getNumberOfCars())
    }
    
    // MARK: - Private
    private let leftRoadside: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Roadside.backgroundColor
        return view
    }()
    
    private let rightRoadside: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Roadside.backgroundColor
        return view
    }()
    
    private var lines: WhiteDottedLinesView!
    private var cars: EnemyCarsView!
    private var hindrances: HindrancesView!
    private var hindranceType: HindranceType!
    
    private func addHindrances(size: Int) {
        hindrances.removeFromSuperview()
        hindrances = HindrancesView(
            frame: frame,
            type: hindranceType,
            size: size
        )
        addSubview(hindrances)
    }
    
}
