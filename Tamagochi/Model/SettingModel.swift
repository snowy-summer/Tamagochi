//
//  SettingModel.swift
//  Tamagochi
//
//  Created by 최승범 on 6/8/24.
//

import Foundation

struct Setting {
    let settingType: SettingType
    var nameLabel: String?
}

struct SettingList {
    let list = [
        Setting(settingType: .changeName,
                nameLabel: UserData.name),
        Setting(settingType: .changeTamagochi,
                nameLabel: nil),
        Setting(settingType: .resetData,
                nameLabel: nil)
    ]
}

enum SettingType {
    case changeName
    case changeTamagochi
    case resetData
    
    var title: String {
        switch self {
        case .changeName:
            return "내 이름 설정하기"
        case .changeTamagochi:
            return "다마고치 변경하기"
        case .resetData:
            return "데이터 초기화"
        }
    }
    
    var imageString: String {
        switch self {
        case .changeName:
            return "pencil"
        case .changeTamagochi:
            return "moon.fill"
        case .resetData:
            return "arrow.clockwise"
        }
    }
}
