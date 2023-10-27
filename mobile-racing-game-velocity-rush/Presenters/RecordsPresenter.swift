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
    
    private func loadRecordsData() {
        recordsInputDelegate?.setupData(with: RecordsManager.shared.getAllRecords())
        recordsInputDelegate?.setupInitialStateForRecords()
    }
    
}

// MARK: - Set
protocol RecordsInputDelegate: AnyObject {
    func setupInitialStateForRecords()
    func setupData(with records: [RecordModel])
    func displayRecords()
}

// MARK: - Get
protocol RecordsOutputDelegate: AnyObject {
    func getData()
    func setData(with record: RecordModel)
}

// MARK: - Extensions
extension RecordsPresenter: RecordsOutputDelegate {
    func getData() {
        loadRecordsData()
    }
    
    func setData(with record: RecordModel) {
        RecordsManager.shared.addRecord(with: record)
    }
    
}
