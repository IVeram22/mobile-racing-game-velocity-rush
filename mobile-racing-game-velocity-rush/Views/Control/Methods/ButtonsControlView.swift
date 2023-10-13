//
//  ButtonsControlView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 12.10.23.
//

import UIKit

final class ButtonsControlView: BaseControlView {
    private let leftButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let rightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(leftButton)
        addSubview(rightButton)
        NSLayoutConstraint.activate([
            leftButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            leftButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            leftButton.widthAnchor.constraint(equalToConstant: frame.width / 2),
            leftButton.heightAnchor.constraint(equalToConstant: frame.height),
            
            rightButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            rightButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            rightButton.widthAnchor.constraint(equalToConstant: frame.width / 2),
            rightButton.heightAnchor.constraint(equalToConstant: frame.height)
        ])
        
        leftButton.addTarget(self, action: #selector(turnLeft), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(turnRight), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
