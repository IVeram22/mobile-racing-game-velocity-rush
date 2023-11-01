//
//  DateManager.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import Foundation

private enum Constants {
    static let dateFormat: String = "dd-MM-yyyy hh:mm a"
}

final class DateManager {
    static let shared = DateManager()
    
    private init() {}
    
    func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat
        return formatter.string(from: date)
    }
    
}
