//
//  RecordsInputDataDelegate.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 1.11.23.
//

import Foundation

protocol RecordsInputDataDelegate: AnyObject {
    func setupData(with records: [RecordModel])
}
