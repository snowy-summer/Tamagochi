//
//  DamagochiModel.swift
//  Damagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit

struct SampleDamagochis {
    var list = [
        DamagochiModel(type: .plant),
        DamagochiModel(type: .sun),
        DamagochiModel(type: .star),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
        DamagochiModel(type: .none),
    ]
}

struct DamagochiModel: Codable {
    var type: DamagochiType
    var name: String = ""
    var level: Int {
        let level = (meal / 5 + water / 2) / 10
        
        if level <= 0 {
            return 1
        } else if level > 10 {
            return 10
        }
        
        return level
    }
    
    var meal: Int = 0
    var water: Int = 0
    
}

enum DamagochiType: Int, Codable {
    case plant = 1
    case sun = 2
    case star = 3
    case none = 0
    
    var defaultName: String {
        switch self {
        case .plant:
            return "따끔따끔 다마고치"
        case .sun:
            return "방실방실 다마고치"
        case .star:
            return "반짝반짝 다마고치"
        case .none:
            return "준비중입니다"
        }
    }
}
