//
//  UserModel.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 21.10.23.
//

import UIKit

final class UserModel: Codable {
    var name: String
    var foto: UIImage?
    
    init(name: String, foto: UIImage?) {
        self.name = name
        if let foto {
            self.foto = foto
        } else {
            self.foto = UIImage(named: "Racer")
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case foto
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        
        let imageData = try container.decode(Data.self, forKey: .foto)
        foto = UIImage(data: imageData)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        
        if let imageData = foto?.pngData() {
            try container.encode(imageData, forKey: .foto)
        }
    }
    
}
