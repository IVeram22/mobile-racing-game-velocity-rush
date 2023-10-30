//
//  ControlsSliderSettingsView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 23.10.23.
//

import UIKit

final class ControlsSliderSettingsView: SliderSettingsView {
    func addControl(with index: Int = 0) {
        self.index = index
        createControl()
    }
    
    override func previousButtonTapped(_ sender: UIButton) {
        index = index - 1 < 0 ? GlobalConstants.Controls.names.count - 1 : index - 1
        removeMainElement()
        createControl()
    }
    
    override func nextButtonTapped(_ sender: UIButton) {
        index = index + 1 == GlobalConstants.Controls.names.count ? 0 : index + 1
        removeMainElement()
        createControl()
    }
    
    private func createControl() {
        mainElement = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: GlobalConstants.Controls.width,
            height: GlobalConstants.Controls.height
        ))
        mainElement.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainElement)
        NSLayoutConstraint.activate([
            mainElement.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainElement.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainElement.widthAnchor.constraint(equalToConstant: GlobalConstants.Controls.width),
            mainElement.heightAnchor.constraint(equalToConstant: GlobalConstants.Controls.height),

        ])
        
        addLabel()
    }
    
    private func addLabel() {
        let label = UILabel(frame: CGRect(
            x: 0,
            y: 0,
            width: GlobalConstants.Controls.width,
            height: GlobalConstants.Controls.height
        ))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = GlobalConstants.Controls.names[index].localized
        label.textColor = GlobalConstants.Controls.colors[index]
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
