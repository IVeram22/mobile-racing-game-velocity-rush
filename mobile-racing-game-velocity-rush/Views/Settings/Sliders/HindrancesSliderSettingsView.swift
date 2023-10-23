//
//  HindrancesSliderSettingsView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 23.10.23.
//

import UIKit

final class HindrancesSliderSettingsView: SliderSettingsView {
    private var hindranceType: HindranceType = .AutumnTree
    
    func addHindrance(with index: Int = 0) {
        self.index = index
        createHindrance()
    }
    
    override func previousButtonTapped(_ sender: UIButton) {
        index = index - 1 < 0 ? HindranceFactory.getSize() - 1 : index - 1
        removeMainElement()
        createHindrance()
    }
    
    override func nextButtonTapped(_ sender: UIButton) {
        index = index + 1 == HindranceFactory.getSize() ? 0 : index + 1
        removeMainElement()
        createHindrance()
    }
    
    private func createHindrance() {
        hindranceType = HindranceFactory.getElementByIndex(with: index)
        mainElement = HindranceFactory.createHindrance(type: hindranceType, frame: CGRect(
            x: 0,
            y: 0,
            width: GlobalConstants.Hindrances.width,
            height: GlobalConstants.Hindrances.height
        ))
        mainElement.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainElement)
        
        NSLayoutConstraint.activate([
            mainElement.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainElement.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainElement.widthAnchor.constraint(equalToConstant: GlobalConstants.Hindrances.width),
            mainElement.heightAnchor.constraint(equalToConstant: GlobalConstants.Hindrances.height),
        ])
        
    }

}
