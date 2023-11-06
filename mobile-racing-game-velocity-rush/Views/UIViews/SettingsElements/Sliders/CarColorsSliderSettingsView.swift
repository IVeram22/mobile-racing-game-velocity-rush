//
//  CarColorsSliderSettingsView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 23.10.23.
//

import UIKit

final class CarColorsSliderSettingsView: SliderSettingsView {
    override func previousButtonTapped(_ sender: UIButton) {
        index = index - 1 < 0 ? GlobalConstants.Cars.colors.count - 1 : index - 1
        mainElement.image = GlobalConstants.Cars.colors[index]
    }
    
    override func nextButtonTapped(_ sender: UIButton) {
        index = index + 1 == GlobalConstants.Cars.colors.count ? 0 : index + 1
        mainElement.image = GlobalConstants.Cars.colors[index]
    }
    
    // MARK: - Public
    func addCar(with index: Int = 0) {
        self.index = index
        mainElement = PlayerCarView(frame: CGRect(
            x: 0,
            y: 0,
            width: GlobalConstants.Cars.width,
            height: GlobalConstants.Cars.height
        ), with: index)
        
        mainElement.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainElement)
        
        NSLayoutConstraint.activate([
            mainElement.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainElement.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainElement.widthAnchor.constraint(equalToConstant: GlobalConstants.Cars.width),
            mainElement.heightAnchor.constraint(equalToConstant: GlobalConstants.Cars.height),
        ])
    }
    
}
