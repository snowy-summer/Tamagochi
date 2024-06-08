//
//  UserData.swift
//  Damagochi
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
    
    static var damagochi: DamagochiModel? {
        get {
            let decoder = JSONDecoder()
            if let damagochiData = UserDefaults.standard.object(forKey: "다마고치") as? Data,
               let damagochi = try? decoder.decode(DamagochiModel.self, from: damagochiData) {
                return damagochi
            }
            
            return nil
        }
        set {
            let encoder = JSONEncoder()

            if let damagochi = try? encoder.encode(newValue) {
                UserDefaults.standard.setValue(damagochi, forKey: "다마고치")
            }
        }
        
        
    }
    
    static func saveName(value: String) {
        UserDefaults.standard.setValue(value, forKey: "UserName")
    }
    
    static func saveDamagochi(value: DamagochiModel) {
        let encoder = JSONEncoder()

        if let damagochi = try? encoder.encode(value) {
            UserDefaults.standard.setValue(damagochi, forKey: "다마고치")
        }

    }
}
