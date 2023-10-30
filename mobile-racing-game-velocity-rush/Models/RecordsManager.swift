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
    
    func removeRecord(with index: Int) {
        var records = read()
        records.remove(at: index)
        saveAll(with: records)
    }
    
    // MARK: - Private
    private func save(with record: RecordModel) {
        var records = read()
        
        records.append(record)
        records.sortedByPoints()
        records.sortedByLevel()
        
        saveAll(with: records)
    }
    
    private func read() -> [RecordModel] {
        UserDefaults.standard.array([RecordModel].self, forKey: Constants.forKey)
    }
    
    private func saveAll(with records: [RecordModel]) {
        UserDefaults.standard.setArray(encodableArray: records, forKey: Constants.forKey)
    }
    
}
