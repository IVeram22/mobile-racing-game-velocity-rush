//
//  BaseHindranceView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 13.10.23.
//

import UIKit

private enum Constants {
    static let width: CGFloat = 40
    static let height: CGFloat = 60
    static let dropShadow: CGFloat = 20
    static let trunkCornerRadius: CGFloat = 5
    
}

class BaseHindranceView: UIView {
    internal let trunk: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal let leaves: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(trunk)
        addSubview(leaves)
        
        NSLayoutConstraint.activate([
            trunk.centerXAnchor.constraint(equalTo: centerXAnchor),
            trunk.bottomAnchor.constraint(equalTo: bottomAnchor),
            trunk.heightAnchor.constraint(equalToConstant: getHeight() * 0.5),
            trunk.widthAnchor.constraint(equalToConstant: getWidth() * 0.3),
            
            leaves.centerXAnchor.constraint(equalTo: centerXAnchor),
            leaves.topAnchor.constraint(equalTo: topAnchor),
            leaves.heightAnchor.constraint(equalToConstant: getHeight() * 0.8),
            leaves.widthAnchor.constraint(equalToConstant:  getWidth()),
        ])
        
        leaves.cornerRadius(with: Constants.trunkCornerRadius)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func getWidth() -> CGFloat {
        Constants.width
    }
    
    internal func getHeight() -> CGFloat {
        Constants.height
    }
    
}
