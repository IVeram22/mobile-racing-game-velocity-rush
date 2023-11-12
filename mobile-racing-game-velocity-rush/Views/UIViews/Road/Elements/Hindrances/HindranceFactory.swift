//
//  HindrancesView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 13.10.23.
//

import UIKit

final class HindranceFactory {
    static func getSize() -> Int {
        5
    }
    
    static func getElementByIndex(with index: Int, frame: CGRect) -> UIImageView {
        let hidrance = UIImageView(frame: frame)
        hidrance.image = UIImage(named: "Hidrance\(index)")
        return hidrance
    }

}
