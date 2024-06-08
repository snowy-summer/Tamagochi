//
//  PickUpViewController.swift
//  Tamagochi
//
//  Created by 최승범 on 6/6/24.
//

import UIKit
import SnapKit

enum PickUpViewType {
    case create
    case change
    
    var buttonName: String {
        switch self {
        case .create:
            return "시작하기"
        case .change:
            return "변경하기"
        }
    }
}

final class PickUpViewController: UIViewController {
    
    private lazy var pickUpCollecionView = UICollectionView(frame: .zero,
                                                            collectionViewLayout: createLayout())
    private var list = SampleTamagochis().list
    
    private let vcType: PickUpViewType
    
    init(type: PickUpViewType) {
        self.vcType = type
        super.init(nibName: nil, bundle: nil)
        
        if vcType == .change {
            guard let tamagochi = UserData.tamagochi else { return }
            
            for index in 0..<list.count {
                list[index].meal = tamagochi.meal
                list[index].water = tamagochi.water
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureUI()
        configureCollectionView()
    }
    
    
}

extension PickUpViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PickUpCollectionViewCell.identifier,
                                                            for: indexPath) as? PickUpCollectionViewCell else {
            return PickUpCollectionViewCell()
        }
        
        let data = list[indexPath.row]
        
        cell.updateContent(data: data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let vc = PopupViewController(model: list[indexPath.row], type: vcType)
        
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle = .overFullScreen
        present(navigation, animated: true)
    }
}

//MARK: - configuration

extension PickUpViewController {
    
    private func configureHierarchy() {
        view.addSubview(pickUpCollecionView)
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor.backgroundColor
        navigationItem.title = "다마고치 선택하기"
        
        pickUpCollecionView.backgroundColor = UIColor.backgroundColor
    }
    
    private func configureCollectionView() {
        
        pickUpCollecionView.delegate = self
        pickUpCollecionView.dataSource = self
        pickUpCollecionView.register(PickUpCollectionViewCell.self,
                                     forCellWithReuseIdentifier: PickUpCollectionViewCell.identifier)
        
        pickUpCollecionView.snp.makeConstraints{ make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    private func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let width = (view.frame.width - 64) / 3
        
        layout.itemSize =  CGSize(width: width,
                                  height: width * 1.25)
        
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        return layout
    }
}
