//
//  BackButton.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 23.10.23.
//

import UIKit

final class BackButton: UIButton {
    private weak var settingsViewControllerBackDelegate: BackButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle("Back".localized, for: .normal)
        setTitleColor(.white, for: .normal)
        cornerRadius()
        addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backgroundColor = .systemGreen
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(with delegate: BackButtonDelegate) {
        settingsViewControllerBackDelegate = delegate
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        settingsViewControllerBackDelegate?.comeBack()
    }
}
