//
//  RecordsOutputDelegate.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 28.10.23.
//

import Foundation

protocol RecordsOutputDelegate: AnyObject {
    func getRecords()
    func addNewRecord(with record: RecordModel)
}
