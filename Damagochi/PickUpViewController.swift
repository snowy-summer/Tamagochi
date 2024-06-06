//
//  PickUpViewController.swift
//  Damagochi
//
//  Created by 최승범 on 6/6/24.
//

import UIKit
import SnapKit

final class PickUpViewController: UIViewController {
    
    private lazy var pickUpCollecionView = UICollectionView(frame: .zero,
                                                            collectionViewLayout: createLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureUI()
        configureCollectionView()
    }
    
    
}

extension PickUpViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PickUpCollectionViewCell.identifier,
                                                            for: indexPath) as? PickUpCollectionViewCell else {
            return PickUpCollectionViewCell()
        }
        
        return cell
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
        var layout = UICollectionViewFlowLayout()
        layout.itemSize =  CGSize(width: view.frame.width * 0.28,
                                  height: view.frame.width * 0.28)
        
        return layout
    }
}
