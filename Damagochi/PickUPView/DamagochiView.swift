//
//  DamagochiView.swift
//  Damagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit
import SnapKit

final class DamagochiView: UIView {
    
    private let damagochiImageView = UIImageView()
    private let damagochiNameView = UIView()
    private let damagochiNameLabel = UILabel(fontSize: 13)
    
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

extension DamagochiView {
    
    func updateContent(data: DamagochiModel) {
        damagochiImageView.image = data.type.image
        
        if data.name.isEmpty {
            damagochiNameLabel.text = data.type.defaultName
        } else {
            damagochiNameLabel.text = data.name
        }
    }
}

//MARK: - Configuration

extension DamagochiView {
    
    private func configureHierarchy() {
        
        addSubview(damagochiImageView)
        addSubview(damagochiNameView)
        damagochiNameView.addSubview(damagochiNameLabel)
    }
    
    private func configureUI() {
        
        backgroundColor = UIColor.backgroundColor
        
        damagochiNameView.layer.cornerRadius = 4
        damagochiNameView.layer.borderWidth = 1
        damagochiNameView.layer.borderColor = UIColor.fontAndBorderColor.cgColor
        
        damagochiNameLabel.textAlignment = .center
    }
    
    private func configureLayout() {
        
        damagochiImageView.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(8)
            make.height.equalTo(damagochiImageView.snp.width)
           
        }
        
        damagochiNameView.snp.makeConstraints { make in
            make.top.equalTo(damagochiImageView.snp.bottom).offset(8)
            make.centerX.equalTo(damagochiImageView.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).inset(8)
        }
        
        damagochiNameLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(4)
            make.verticalEdges.equalToSuperview()
        }
    }
}
