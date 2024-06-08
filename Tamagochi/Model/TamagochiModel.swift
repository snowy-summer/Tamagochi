//
//  TamagochiModel.swift
//  Tamagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit

struct SampleTamagochis {
    var list = [
        TamagochiModel(type: .plant),
        TamagochiModel(type: .sun),
        TamagochiModel(type: .star),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
        TamagochiModel(type: .none),
    ]
}

struct TamagochiModel: Codable {
    var type: TamagochiType
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

enum TamagochiType: Int, Codable {
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
    
    var description: String {
            switch self {
            case .plant:
                return "이 다마고치는 식물을 좋아하며 자연 속에서 성장합니다. 따끔따끔한 성격을 가지고 있어요."
            case .sun:
                return "이 다마고치는 태양을 좋아하며 밝고 활기찬 성격을 가지고 있습니다. 방실방실 웃는 모습이 매력적입니다."
            case .star:
                return "이 다마고치는 별을 좋아하며 빛나는 성격을 가지고 있습니다. 반짝반짝 빛나는 모습을 자랑합니다."
            case .none:
                return "준비중입니다"
            }
        }
}
