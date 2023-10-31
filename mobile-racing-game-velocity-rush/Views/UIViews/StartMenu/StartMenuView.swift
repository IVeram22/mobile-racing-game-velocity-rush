//
//  StartMenuView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

private enum Constants {
    static let widthAnchor: CGFloat = 131
    static let heightAnchor: CGFloat = 35
    static let topPadding: CGFloat = 15
    
    enum StartButton {
        static let backgroundColor: UIColor = .systemGreen
    }
    
    enum SettingsButton {
        static let backgroundColor: UIColor = .systemYellow
        static let titleColor: UIColor = .black
    }
    
    enum RecordsButton {
        static let backgroundColor: UIColor = .systemRed
    }
}

final class StartMenuView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(startGameButton)
        addSubview(settingsButton)
        addSubview(recordsButton)
        
        NSLayoutConstraint.activate([
            startGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startGameButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topPadding),
            startGameButton.widthAnchor.constraint(equalToConstant: Constants.widthAnchor),
            startGameButton.heightAnchor.constraint(equalToConstant: Constants.heightAnchor),
            
            settingsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            settingsButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: Constants.topPadding),
            settingsButton.widthAnchor.constraint(equalToConstant: Constants.widthAnchor),
            settingsButton.heightAnchor.constraint(equalToConstant: Constants.heightAnchor),
            
            recordsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recordsButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: Constants.topPadding),
            recordsButton.widthAnchor.constraint(equalToConstant: Constants.widthAnchor),
            recordsButton.heightAnchor.constraint(equalToConstant: Constants.heightAnchor),
        ])
        
        addButtonsTargets()
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
    private let startGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start game".localized, for: .normal)
        button.backgroundColor = Constants.StartButton.backgroundColor
        button.setupDefault()
        return button
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Settings".localized, for: .normal)
        button.backgroundColor = Constants.SettingsButton.backgroundColor
        button.setupDefault()
        button.setTitleColor(Constants.SettingsButton.titleColor, for: .normal)
        return button
    }()
    
    private let recordsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Records".localized, for: .normal)
        button.backgroundColor = Constants.RecordsButton.backgroundColor
        button.setupDefault()
        return button
    }()
    
    private weak var viewControllerDelegate: ViewControllerDelegate?
    
    private func addButtonsTargets() {
        startGameButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        recordsButton.addTarget(self, action: #selector(recordsButtonTapped), for: .touchUpInside)
    }
    
}
