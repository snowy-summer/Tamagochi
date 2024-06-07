//
//  TextField+Extension.swift
//  Damagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit

extension UITextField {
    
    func addUnderLine() {
        borderStyle = .none
        
        let line = CALayer()
        
        line.frame = CGRect(x: 0,
                            y: frame.size.height - 1,
                            width: frame.width,
                            height: 49)
        line.backgroundColor = UIColor.fontAndBorderColor.cgColor
        layer.addSublayer(line)
        layer.masksToBounds = true
    }
}
