//
//  SettingViewController.swift
//  Tamagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit
import SnapKit

final class SettingViewController: UIViewController {
    
    private let settingTableView = UITableView()
    private var settingList = SettingList().list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierachy()
        configureUI()
        configureLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let name = UserData.name else { return }
        
        settingList[0].nameLabel = name
        settingTableView.reloadData()
    }
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - configuration

extension SettingViewController {
    
    private func configureHierachy() {
        
        view.addSubview(settingTableView)
        
    }
    
    private func configureUI() {
        
        configureNavigationBar()
        view.backgroundColor = .backgroundColor
        configureTableView()
        
    }
    
    private func configureLayout() {
        
        settingTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureNavigationBar() {
        
        self.navigationController?.navigationBar.tintColor = .fontAndBorderColor
        
        let backItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                       style: .plain,
                                       target: self,
                                       action: #selector(popVC))
        
        navigationItem.title = "설정"
        navigationItem.leftBarButtonItem = backItem
    }
    
    private func configureTableView() {
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = .backgroundColor
        settingTableView.register(SettingTableViewCell.self,
                                  forCellReuseIdentifier: SettingTableViewCell.identifier)
        settingTableView.rowHeight = 44
        
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier,
                                                       for: indexPath) as? SettingTableViewCell else {
            return SettingTableViewCell()
        }
        
        let data = settingList[indexPath.row]
        cell.updateContent(data: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let settingType = settingList[indexPath.row]
        
        
        switch settingType.settingType {
        case .changeName:
            let vc = NameSettingViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        case .changeTamagochi:
            let vc = PickUpViewController(type: .change)
            navigationController?.pushViewController(vc, animated: true)
            
        case .resetData:
            showRemindAlert()
        }
        
    }
    
}

extension SettingViewController {
    
    private func showRemindAlert() {
        let resetAlert = UIAlertController(title: "데이터 초기화",
                                           message: "정말 다시 처음부터 시작하실 건가용?",
                                           preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "웅",
                                          style: .cancel) {[weak self] _ in
            UserData.resetData()
            self?.navigationController?.setViewControllers([PickUpViewController(type: .create)], animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "아냐!",
                                         style: .default)
        
        resetAlert.addAction(cancelAction)
        resetAlert.addAction(confirmAction)
        
        self.present(resetAlert,
                     animated: false)
    }
}
