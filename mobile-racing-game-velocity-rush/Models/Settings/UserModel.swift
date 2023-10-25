//
//  UserModel.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 21.10.23.
//

import UIKit

final class UserModel: Codable {
    // MARK: - Public
    var name: String
    var foto: UIImage? {
        get {
            guard let fotoData = fotoData else {
                return UIImage(named: "Racer")
            }
            return UIImage(data: fotoData)
        }
        set {
            fotoData = newValue?.jpegData(compressionQuality: 1.0)
        }
    }
    
    init(name: String, foto: UIImage?) {
        self.name = name
        self.foto = foto
    }
    
    // MARK: - Codable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        fotoData = try container.decode(Data.self, forKey: .fotoData)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(fotoData, forKey: .fotoData)
    }
    
    // MARK: - Private
    private var fotoData: Data?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case fotoData
    }
    
}
