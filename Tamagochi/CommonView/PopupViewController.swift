//
//  PopupViewController.swift
//  Tamagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit
import SnapKit

final class PopupViewController: UIViewController {
    
    private let popupView = UIView()
    private let tamagochiView = TamagochiView()
    private let lineView = UIView()
    private let descriptionLabel = UILabel(fontSize: 15)
    private let buttonLineView = UIView()
    private let cancelButton = UIButton()
    private let startButton = UIButton()
    
    private var tamagochi: TamagochiModel
    private let vcType: PickUpViewType
    
    init(model: TamagochiModel, type: PickUpViewType) {
        self.tamagochi = model
        self.vcType = type
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
        tamagochiView.updateContent(data: tamagochi)
        descriptionLabel.text = tamagochi.type.description
    }
    
    @objc private func cancelButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc private func startButtonClicked() {
        
        UserData.saveTamagochi(value: tamagochi)
        
        let vc = MainViewController(tamagochi: tamagochi)
        navigationController?.setViewControllers([vc], animated: true)
    }
    
}


//MARK: - configuration

extension PopupViewController {
    
    private func configureHierachy() {
    
        view.addSubview(popupView)
        popupView.addSubview(tamagochiView)
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
        
        startButton.setTitle(vcType.buttonName,
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
        
        tamagochiView.snp.makeConstraints { make in
            make.top.equalTo(popupView.snp.top).inset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(popupView.snp.width).multipliedBy(0.5)
            make.height.equalTo(tamagochiView.snp.width).multipliedBy(1.2)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(tamagochiView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(32)
            make.height.equalTo(1)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(32)
            
        }
        
        cancelButton.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview()
            make.height.equalTo(44)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        startButton.snp.makeConstraints { make in
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
