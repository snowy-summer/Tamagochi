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

struct DamagochiModel {
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

enum DamagochiType {
    case plant
    case sun
    case star
    case none
    
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
    
    var image: UIImage {
        switch self {
        case .plant:
            return UIImage(resource:  ._1_8)
        case .sun:
            return UIImage(resource: ._2_8)
        case .star:
            return UIImage(resource: ._3_8)
        case .none:
            return UIImage(resource: .no)
        }
    }
}