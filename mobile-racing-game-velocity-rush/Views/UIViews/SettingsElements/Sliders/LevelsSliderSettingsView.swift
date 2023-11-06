//
//  LevelsSliderSettingsView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 23.10.23.
//

import UIKit

final class LevelsSliderSettingsView: SliderSettingsView {
    override func previousButtonTapped(_ sender: UIButton) {
        index = index - 1 < 0 ? GlobalConstants.Levels.names.count - 1 : index - 1
        removeMainElement()
        createLevel()
    }
    
    override func nextButtonTapped(_ sender: UIButton) {
        index = index + 1 == GlobalConstants.Levels.names.count ? 0 : index + 1
        removeMainElement()
        createLevel()
    }
    
    // MARK: - Public
    func addLevel(with index: Int = 0) {
        self.index = index
        createLevel()
    }
    
    // MARK: - Private
    private func createLevel() {
        mainElement = UIImageView(frame: CGRect(
            x: 0,
            y: 0,
            width: GlobalConstants.Levels.width,
            height: GlobalConstants.Levels.height
        ))
        
        mainElement.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainElement)
        
        NSLayoutConstraint.activate([
            mainElement.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainElement.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainElement.widthAnchor.constraint(equalToConstant: GlobalConstants.Levels.width),
            mainElement.heightAnchor.constraint(equalToConstant: GlobalConstants.Levels.height),

        ])
        
        addLabel()
    }
    
    private func addLabel() {
        let label = UILabel(frame: CGRect(
            x: 0,
            y: 0,
            width: GlobalConstants.Levels.width,
            height: GlobalConstants.Levels.height
        ))
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = GlobalConstants.Levels.names[index].localized
        label.textColor = GlobalConstants.Levels.colors[index]
        label.textAlignment = .center
        
        mainElement.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: mainElement.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: mainElement.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: GlobalConstants.Levels.width),
            label.heightAnchor.constraint(equalToConstant: GlobalConstants.Levels.height),
        ])
    }
    
}
