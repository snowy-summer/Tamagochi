//
//  UILabel+Extension.swift
//  Tamagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit

extension UILabel {
    convenience public init(fontSize: CGFloat) {
        self.init(frame: .zero)
        font = .systemFont(ofSize: fontSize, weight: .medium)
        textColor = .fontAndBorderColor
        backgroundColor = .backgroundColor
    }
}
