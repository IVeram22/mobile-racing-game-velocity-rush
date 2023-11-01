//
//  UserModel.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 21.10.23.
//

import UIKit

private enum Constants {
    static let defaultFoto: String = "Racer"
    
}

final class UserModel: Codable {
    var name: String
    var foto: UIImage?
    
    init(name: String, foto: UIImage?) {
        self.name = name
        self.foto = foto ?? UIImage(named: Constants.defaultFoto)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        
        let imageData = try container.decode(Data.self, forKey: .foto)
        foto = UIImage(data: imageData)
    }
    
    // MARK: - Public
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        
        if let imageData = foto?.pngData() {
            try container.encode(imageData, forKey: .foto)
        }
    }
    
    // MARK: - Private
    private enum CodingKeys: String, CodingKey {
        case name
        case foto
    }
    
}
