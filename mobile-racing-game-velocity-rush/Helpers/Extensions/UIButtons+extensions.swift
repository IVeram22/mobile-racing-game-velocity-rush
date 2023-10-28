//
//  UIButtons+extensions.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

private enum Constants {
    enum Menu {
        static let cornerRadius: CGFloat = 10
    }
    
}

extension UIButton {
    func setupDefault() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = Constants.Menu.cornerRadius
    }
    
}
