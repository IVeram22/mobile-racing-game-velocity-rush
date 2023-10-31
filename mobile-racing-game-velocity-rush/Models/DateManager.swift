//
//  DateManager.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import Foundation

final class DateManager {
    static let shared = DateManager()
    
    private init() {}
    
    func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy hh:mm a"
        return formatter.string(from: date)
    }
    
}
