//
//  UserData.swift
//  Tamagochi
//
//  Created by 최승범 on 6/8/24.
//

import Foundation

struct UserData {
    
    static var name: String? {
           get {
               return UserDefaults.standard.string(forKey: "UserName")
           }
           set {
               UserDefaults.standard.setValue(newValue, forKey: "UserName")
           }
       }
    
    static var tamagochi: TamagochiModel? {
        get {
            let decoder = JSONDecoder()
            if let tamagochiData = UserDefaults.standard.object(forKey: "다마고치") as? Data,
               let tamagochi = try? decoder.decode(TamagochiModel.self, from: tamagochiData) {
                return tamagochi
            }
            
            return nil
        }
        set {
            let encoder = JSONEncoder()

            if let tamagochi = try? encoder.encode(newValue) {
                UserDefaults.standard.setValue(tamagochi, forKey: "다마고치")
            }
        }
        
        
    }
    
    static func saveName(value: String) {
        UserDefaults.standard.setValue(value, forKey: "UserName")
    }
    
    static func saveTamagochi(value: TamagochiModel) {
        let encoder = JSONEncoder()

        if let tamagochi = try? encoder.encode(value) {
            UserDefaults.standard.setValue(tamagochi, forKey: "다마고치")
        }

    }
    
    static func resetData() {
        UserDefaults.standard.setValue("대장", forKey: "UserName")
        UserDefaults.standard.removeObject(forKey: "다마고치")
    }
}
