//
//  TextFieldAndButtonView.swift
//  Damagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit
import SnapKit

final class FeedView: UIView {
    
    private let textField = UITextField()
    private let button = UIButton()
    private let feedType: FeedType
    
    init(feedType: FeedType) {
        self.feedType = feedType
        super.init(frame: .zero)
        
        configureHierarchy()
        configureUI()
        configureLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textField.addUnderLine()
    }
}

//MARK: - Configuration

extension FeedView {
    
    private func configureHierarchy() {
        addSubview(textField)
        addSubview(button)
    }
    
    private func configureUI() {
        
        switch feedType {
        case .meal:
            textField.placeholder = "밥주세용"
            button.setTitle("밥먹기", for: .normal)
            button.setImage(UIImage(systemName: "drop.circle"),
                            for: .normal)
        case .water:
            textField.placeholder = "물주세용"
            button.setTitle("물먹기", for: .normal)
            button.setImage(UIImage(systemName: "leaf.circle"),
                            for: .normal)
        }
        
        textField.textAlignment = .center
        textField.addUnderLine()
        
        
        button.setTitleColor(.fontAndBorderColor, for: .normal)
        button.tintColor = .fontAndBorderColor
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.fontAndBorderColor.cgColor
        button.backgroundColor = .backgroundColor
    }
    
    private func configureLayout() {
        
        textField.snp.makeConstraints { make in
            make.verticalEdges.leading.equalToSuperview()
            
        }
        
        button.snp.makeConstraints { make in
            make.verticalEdges.trailing.equalToSuperview()
            make.leading.equalTo(textField.snp.trailing).offset(8)
            make.width.equalTo(self.snp.width).multipliedBy(0.3)
        }
    }
}


enum FeedType {
    case meal
    case water
}
