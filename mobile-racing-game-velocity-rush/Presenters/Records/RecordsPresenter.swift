//
//  RecordsPresenter.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 27.10.23.
//

import Foundation

final class RecordsPresenter {
    weak private var recordsInputDelegate: RecordsInputDelegate?
    
    func setRecordsInputDelegate(with delegate: RecordsInputDelegate) {
        recordsInputDelegate = delegate
    }
    
    private func loadRecords() {
        recordsInputDelegate?.setupData(with: RecordsManager.shared.getAllRecords())
        recordsInputDelegate?.setupInitialStateForRecords()
    }
    
}

// MARK: - Extensions
extension RecordsPresenter: RecordsOutputDelegate {
    func getRecords() {
        loadRecords()
    }
    
    func addNewRecord(with record: RecordModel) {
        RecordsManager.shared.addRecord(with: record)
    }
    
}
