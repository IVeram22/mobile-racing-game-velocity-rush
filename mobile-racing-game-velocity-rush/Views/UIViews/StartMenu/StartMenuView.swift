//
//  StartMenuView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

private enum Constants {
    enum StartButton {
        static let size: CGFloat = 136
        static let centerXAnchorConstant: CGFloat = 27
    }
    
    enum SettingsButton {
        static let size: CGFloat = 60
        static let rightAnchor: CGFloat = -30
        static let bottomAnchor: CGFloat = -53
    }
    
    enum RecordsButton {
        static let size: CGFloat = 60
        static let leftAnchor: CGFloat = 30
        static let bottomAnchor: CGFloat = -53
    }

}

final class StartMenuView: UIView {
    // MARK: Interface
    private let startGameButton: UIButton = {
        let button = UIButton()
        button.setupDefault()
        button.setImage(UIImage(named: "StartGame"), for: .normal)
        return button
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setupDefault()
        button.setImage(UIImage(named: "Settings"), for: .normal)
        return button
    }()
    
    private let recordsButton: UIButton = {
        let button = UIButton()
        button.setupDefault()
        button.setImage(UIImage(named: "Records"), for: .normal)
        return button
    }()
    
    // MARK: Delegate
    private weak var viewControllerDelegate: ViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func startGameButtonTapped(_ sender: UIButton) {
        viewControllerDelegate?.startPlaying()
    }
    
    @objc private func settingsButtonTapped(_ sender: UIButton) {
        viewControllerDelegate?.openSettings()
    }
    
    @objc private func recordsButtonTapped(_ sender: UIButton) {
        viewControllerDelegate?.seeRecords()
    }
    
    // MARK: - Public
    func setViewControllerDelegate(with delegate: ViewControllerDelegate) {
        viewControllerDelegate = delegate
    }
    
    // MARK: - Private
    private func setupInterface() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(startGameButton)
        addSubview(settingsButton)
        addSubview(recordsButton)
        
        NSLayoutConstraint.activate([
            startGameButton.centerXAnchor.constraint(
                equalTo: centerXAnchor,
                constant: Constants.StartButton.centerXAnchorConstant),
            startGameButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            startGameButton.widthAnchor.constraint(equalToConstant: Constants.StartButton.size),
            startGameButton.heightAnchor.constraint(equalToConstant: Constants.StartButton.size),
            
            settingsButton.rightAnchor.constraint(
                equalTo: rightAnchor,
                constant: Constants.SettingsButton.rightAnchor),
            settingsButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.SettingsButton.bottomAnchor),
            settingsButton.widthAnchor.constraint(equalToConstant: Constants.SettingsButton.size),
            settingsButton.heightAnchor.constraint(equalToConstant: Constants.SettingsButton.size),

            recordsButton.leftAnchor.constraint(
                equalTo: leftAnchor,
                constant: Constants.RecordsButton.leftAnchor),
            recordsButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.RecordsButton.bottomAnchor),
            recordsButton.widthAnchor.constraint(equalToConstant: Constants.SettingsButton.size),
            recordsButton.heightAnchor.constraint(equalToConstant: Constants.SettingsButton.size),
        ])
        
        addButtonsTargets()
    }
    
    private func addButtonsTargets() {
        startGameButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        recordsButton.addTarget(self, action: #selector(recordsButtonTapped), for: .touchUpInside)
    }
    
}
