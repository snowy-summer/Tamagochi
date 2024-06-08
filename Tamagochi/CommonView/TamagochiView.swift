//
//  TamagochiView.swift
//  Tamagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit
import SnapKit

final class TamagochiView: UIView {
    
    private let tamagochiImageView = UIImageView()
    private let tamagochiNameView = UIView()
    private let tamagochiNameLabel = UILabel(fontSize: 13)
    
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

extension TamagochiView {
    
    func updateContent(data: TamagochiModel) {
        
        
        if data.type != .none {
            if data.level == 10 {
                tamagochiImageView.image = UIImage(named: "\(data.type.rawValue)-\(9)")
            } else {
                tamagochiImageView.image = UIImage(named: "\(data.type.rawValue)-\(data.level)")
            }
        } else {
            tamagochiImageView.image = UIImage(resource: .no)
        }
        
        
        
        
        
        
        if data.name.isEmpty {
            tamagochiNameLabel.text = data.type.defaultName
        } else {
            tamagochiNameLabel.text = data.name
        }
    }
}

//MARK: - Configuration

extension TamagochiView {
    
    private func configureHierarchy() {
        
        addSubview(tamagochiImageView)
        addSubview(tamagochiNameView)
        tamagochiNameView.addSubview(tamagochiNameLabel)
    }
    
    private func configureUI() {
        
        backgroundColor = UIColor.backgroundColor
        
        tamagochiNameView.layer.cornerRadius = 4
        tamagochiNameView.layer.borderWidth = 1
        tamagochiNameView.layer.borderColor = UIColor.fontAndBorderColor.cgColor
        
        tamagochiNameLabel.textAlignment = .center
    }
    
    private func configureLayout() {
        
        tamagochiImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(tamagochiImageView.snp.width)
           
        }
        
        tamagochiNameView.snp.makeConstraints { make in
            make.top.equalTo(tamagochiImageView.snp.bottom).offset(8)
            make.centerX.equalTo(tamagochiImageView.snp.centerX)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        tamagochiNameLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(4)
            make.verticalEdges.equalToSuperview()
        }
    }
}
