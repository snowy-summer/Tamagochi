//
//  StartPopupViewController.swift
//  Damagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit
import SnapKit

final class StartPopupViewController: UIViewController {
    
    private let popupView = UIView()
    private let damagochiView = DamagochiView()
    private let lineView = UIView()
    private let descriptionLabel = UILabel(fontSize: 15)
    private let buttonLineView = UIView()
    private let cancelButton = UIButton()
    private let startButton = UIButton()
    
    private var damagochi: DamagochiModel
    
    init(model: DamagochiModel) {
        self.damagochi = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierachy()
        configureUI()
        configureLayout()
        updateContent()
    }

    private func updateContent() {
        damagochiView.updateContent(data: damagochi)
        descriptionLabel.text = "방실방실 방실방실 방실방실 방실방실 방실방실 방실방실 방실방실.  방실방실 방실방실 방실방실 방실방실 방실방실 방실방실 방실방실 방실방실 방실방실 "
    }
    
    @objc private func cancelButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc private func startButtonClicked() {
        
        let vc = MainViewController(damagochi: damagochi)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


//MARK: - configuration

extension StartPopupViewController {
    
    private func configureHierachy() {
    
        view.addSubview(popupView)
        popupView.addSubview(damagochiView)
        popupView.addSubview(lineView)
        popupView.addSubview(descriptionLabel)
        popupView.addSubview(buttonLineView)
        popupView.addSubview(cancelButton)
        popupView.addSubview(startButton)
    }
    
    private func configureUI() {
        
        view.backgroundColor = .black.withAlphaComponent(0.3)
        
        popupView.backgroundColor = .backgroundColor
        popupView.layer.cornerRadius = 8
        popupView.clipsToBounds = true
        
        lineView.backgroundColor = .lightGray
        
        descriptionLabel.numberOfLines = .zero
        descriptionLabel.textAlignment = .center
        
        buttonLineView.backgroundColor = .lightGray
        
        cancelButton.setTitle("취소",
                              for: .normal)
        cancelButton.backgroundColor = #colorLiteral(red: 0.8956304193, green: 0.9305438995, blue: 0.9342421889, alpha: 1)
        cancelButton.setTitleColor(.fontAndBorderColor,
                                  for: .normal)
        cancelButton.addTarget(self,
                               action: #selector(cancelButtonClicked),
                               for: .touchUpInside)
        
        startButton.setTitle("시작하기",
                             for: .normal)
        startButton.backgroundColor = .backgroundColor
        startButton.setTitleColor(.fontAndBorderColor,
                                  for: .normal)
        startButton.addTarget(self,
                              action: #selector(startButtonClicked),
                              for: .touchUpInside)
    }
    
    private func configureLayout() {
        
        popupView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(32)
            make.centerY.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.55)
        }
        
        damagochiView.snp.makeConstraints { make in
            make.top.equalTo(popupView.snp.top).inset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(popupView.snp.width).multipliedBy(0.5)
            make.height.equalTo(damagochiView.snp.width).multipliedBy(1.25)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(damagochiView.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(32)
            make.height.equalTo(1)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(32)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.bottom.leading.equalToSuperview()
            make.height.equalTo(44)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.bottom.trailing.equalToSuperview()
            make.height.equalTo(44)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        buttonLineView.snp.makeConstraints { make in
            make.bottom.equalTo(startButton.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }

}
