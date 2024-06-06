//
//  PickUpCollectionViewCell.swift
//  Damagochi
//
//  Created by 최승범 on 6/6/24.
//

import UIKit

final class PickUpCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
