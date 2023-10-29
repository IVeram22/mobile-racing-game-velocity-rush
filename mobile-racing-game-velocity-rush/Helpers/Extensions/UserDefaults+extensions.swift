//
//  UserDefaults+extensions.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import Foundation

extension UserDefaults {
    // MARK: - Save data
    func set<T: Encodable>(encodable: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key)
        }
    }
    
    func setArray<T: Encodable>(encodableArray: [T], forKey key: String) {
        if let data = try? JSONEncoder().encode(encodableArray) {
            set(data, forKey: key)
        }
    }
    
    // MARK: - Load data
    func object<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data,
           let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }
    
    func array<T: Decodable>(_ type: [T].Type, forKey key: String) -> [T] {
        if let data = object(forKey: key) as? Data,
           let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return []
    }
    
}
