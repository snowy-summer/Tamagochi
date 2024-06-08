//
//  SettingTableViewCell.swift
//  Damagochi
//
//  Created by 최승범 on 6/8/24.
//

import UIKit
import SnapKit

final class SettingTableViewCell: UITableViewCell {

    private let iconImageView = UIImageView()
    private let titleLabel = UILabel(fontSize: 15)
    private let nameLabel = UILabel()
    private let accessoryImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateContent(data: Setting) {
        
        iconImageView.image = UIImage(systemName: data.settingType.imageString)
        titleLabel.text = data.settingType.title
        nameLabel.text = data.nameLabel
    }
}

//MARK: - configuration

extension SettingTableViewCell {
    
    private func configureHierarchy() {
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(accessoryImageView)
        
    }
    
    private func configureUI() {
        
        contentView.backgroundColor = UIColor.backgroundColor
        accessoryImageView.image = UIImage(systemName: "chevron.compact.right")
        
        iconImageView.tintColor = .fontAndBorderColor
        accessoryImageView.tintColor = .lightGray
        
        nameLabel.font = .systemFont(ofSize: 13)
        nameLabel.textColor = .lightGray
        nameLabel.textAlignment = .right
    }
    
    private func configureLayout() {
        
        iconImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).inset(16)
            make.height.equalTo(20)
            make.width.equalTo(iconImageView.snp.height)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
            make.verticalEdges.equalToSuperview()
            make.width.equalTo(contentView.snp.width).multipliedBy(0.4)
        }
        
        accessoryImageView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).inset(16)
            make.height.equalTo(16)
            make.width.equalTo(accessoryImageView.snp.height)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(8)
            make.trailing.equalTo(accessoryImageView.snp.leading).offset(-16)
            make.verticalEdges.equalToSuperview()
        }
    }
}
