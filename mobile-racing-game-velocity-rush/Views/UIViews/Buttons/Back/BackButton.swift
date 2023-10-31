//
//  BackButton.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 23.10.23.
//

import UIKit

private enum Constants {
    static let title: String = "Back".localized
    static let titleColor: UIColor = .white
    static let backgroundColor: UIColor = .systemGreen
    
}

final class BackButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        settingsViewControllerBackDelegate?.comeBack()
    }
    
    // MARK: - Public
    func setDelegate(with delegate: BackButtonDelegate) {
        settingsViewControllerBackDelegate = delegate
    }
    
    // MARK: - Private
    private weak var settingsViewControllerBackDelegate: BackButtonDelegate?
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(Constants.title, for: .normal)
        setTitleColor(Constants.titleColor, for: .normal)
        backgroundColor = Constants.backgroundColor
        cornerRadius()
    }
    
    private func addTarget() {
        addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
}
