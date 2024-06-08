//
//  NameSettingViewController.swift
//  Tamagochi
//
//  Created by 최승범 on 6/8/24.
//

import UIKit
import SnapKit

final class NameSettingViewController: UIViewController {
    
    private let nameInputTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        congfigureNavigationBar()
        configureHierachy()
        configureUI()
        configureLayout()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameInputTextField.addUnderLine()
    }
    
}

extension NameSettingViewController {
    
    @objc private func saveButtonClicked() {
        guard let name = nameInputTextField.text else { return }
        
        if name.count >= 2 && name.count <= 6 {
            UserData.saveName(value: name)
            
            guard let name = UserData.name else { return }
            navigationItem.title = "\(name) 이름 정하기"
            
            showConfirmAlert()
        }
        
    }
    
    private func showConfirmAlert() {
        
        
        let alert = UIAlertController(title: "알림",
                                      message: "이름이 \(UserData.name!)변경되었습니다.",
                                      preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "확인",
                                          style: .cancel)
        
        alert.addAction(confirmAction)
        
        
        self.present(alert,
                     animated: false)
        
    }
}

//MARK: - configuration

extension NameSettingViewController {
    
    private func configureHierachy() {
        
        view.addSubview(nameInputTextField)
        
    }
    
    private func configureUI() {
        view.backgroundColor = .backgroundColor
        self.navigationController?.navigationBar.tintColor = .fontAndBorderColor
        
        nameInputTextField.placeholder = "2 ~ 6 글자 이름을 입력해주세요"
        nameInputTextField.text = UserData.name
        
    }
    
    private func configureLayout() {
        nameInputTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.height.equalTo(44)
        }
        
    }
    
    private func congfigureNavigationBar() {
        
        guard let name = UserData.name else { return }
        navigationItem.title = "\(name) 이름 정하기"
        
        let saveItem = UIBarButtonItem(title: "저장",
                                       style: .plain,
                                       target: self,
                                       action: #selector(saveButtonClicked))
        
        
        navigationItem.rightBarButtonItem = saveItem
        
        
    }
    
}
