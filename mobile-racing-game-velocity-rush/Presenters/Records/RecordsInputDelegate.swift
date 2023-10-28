//
//  RecordsInputDelegate.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 28.10.23.
//

import Foundation

protocol RecordsInputDelegate: AnyObject {
    func setupInitialStateForRecords()
    func setupData(with records: [RecordModel])
    func displayRecords()
}
