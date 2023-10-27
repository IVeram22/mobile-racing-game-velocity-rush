//
//  AutumnTreeHindranceView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 14.10.23.
//

import UIKit

private enum Constants {
    enum Trunk {
        static let backgroundColor: UIColor = .brown
    }
    
    enum Leaves {
        static let backgroundColor: UIColor = .systemOrange
    }
    
}

class AutumnTreeHindranceView: BaseHindranceView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        trunk.backgroundColor = Constants.Trunk.backgroundColor
        leaves.backgroundColor = Constants.Leaves.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
