//
//  GameOverView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 13.10.23.
//

import UIKit

final class GameOverView: UIView {
    private var shadow: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        alpha = 0.7
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
        
    }
}
