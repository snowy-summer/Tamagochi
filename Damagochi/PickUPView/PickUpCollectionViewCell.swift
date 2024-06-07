//
//  PickUpCollectionViewCell.swift
//  Damagochi
//
//  Created by 최승범 on 6/6/24.
//

import UIKit
import SnapKit

final class PickUpCollectionViewCell: UICollectionViewCell {
    
    private let damagochiView = DamagochiView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Method

extension PickUpCollectionViewCell {
    
    func updateContent(data: DamagochiModel) {
        
        damagochiView.updateContent(data: data)
    }
    
}

//MARK: - Configuration

extension PickUpCollectionViewCell {
    
    private func configureHierarchy() {
        
        contentView.addSubview(damagochiView)
    }
    
    private func configureUI() {
        
        contentView.backgroundColor = UIColor.backgroundColor
    }
    
    private func configureLayout() {
        
        damagochiView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
