//
//  RecordsManager.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import Foundation

private enum Constants {
    static let forKey: String = "RecordModelKey"
}

final class RecordsManager {
    static let shared = RecordsManager()
    
    private init() {}
    
    // MARK: - Public
    func getAllRecords() -> [RecordModel] {
        read()
    }
    
    func addRecord(with record: RecordModel) {
        save(with: record)
    }
    
    // MARK: - Private
    private func save(with record: RecordModel) {
        var records = read()
        records.append(record)
        UserDefaults.standard.set(encodable: records, forKey: Constants.forKey)
    }
    
    private func read() -> [RecordModel] {
        UserDefaults.standard.object([RecordModel].self, forKey: Constants.forKey) ?? []
    }
    
}
