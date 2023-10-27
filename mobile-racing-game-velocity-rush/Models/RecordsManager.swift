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
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(records) {
            UserDefaults.standard.set(encodedData, forKey: Constants.forKey)
        }
    }
    
    private func read() -> [RecordModel] {
        if let savedData = UserDefaults.standard.data(forKey: Constants.forKey) {
            let decoder = JSONDecoder()
            if let loadedRecordModels = try? decoder.decode([RecordModel].self, from: savedData) {
                return loadedRecordModels
            }
        }
        return []
    }
    
}
