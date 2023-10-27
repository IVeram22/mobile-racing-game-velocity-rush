//
//  UserDefaults+extensions.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import Foundation

extension UserDefaults {
    // MARK: - Save the encoded data to UserDefaults
    func set<T: Encodable>(encodable: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key)
            print("*** Save object")
        }
    }
    
    // MARK: - Use the loaded data array
    func object<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data,
            let value = try? JSONDecoder().decode(type, from: data) {
            print("*** Read object")
            return value
        }
        return nil
    }
    
}
