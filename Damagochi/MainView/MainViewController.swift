//
//  MainViewController.swift
//  Damagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    private let bubbleImageView = UIImageView()
    private let bubbleLabel = UILabel(fontSize: 15)
    private let damagochiView = DamagochiView()
    private let levelLabel = UILabel(fontSize: 15)
    private let mealFeedView = FeedView(feedType: .meal)
    private let waterFeedView = FeedView(feedType: .water)
    
    private var damagochi: DamagochiModel {
        didSet {
            levelLabel.text = "LV\(damagochi.level) . 밥알 \(damagochi.meal)개 . 물방울 \(damagochi.water)개"
            damagochiView.updateContent(data: damagochi)
            UserData.saveDamagochi(value: damagochi)
        }
    }
    
    init(damagochi: DamagochiModel) {
        self.damagochi = damagochi
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
    }

    @objc private func pushSettingVC() {
        let vc = SettingViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}

//MARK: - FeedViewDelegate
extension MainViewController: FeedViewDelegate {
    
    func feedingWater(value: Int) {
        damagochi.water += value
    }
    
    func feedingMeal(value: Int) {
        damagochi.meal += value
    }
    
}

//MARK: - configuration

extension MainViewController {
    
    private func configureHierachy() {
    
        view.addSubview(damagochiView)
        view.addSubview(bubbleImageView)
        view.addSubview(bubbleLabel)
        view.addSubview(levelLabel)
        view.addSubview(mealFeedView)
        view.addSubview(waterFeedView)
      
    }
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundColor

        configureNavigationBar()
        
        damagochiView.updateContent(data: damagochi)
        
        bubbleImageView.image = UIImage(resource: .bubble)
        bubbleImageView.contentMode = .scaleAspectFill
        bubbleLabel.numberOfLines = .zero
        
        guard let name = UserData.name else { return }
        
        bubbleLabel.text = "\(name)님 오늘 깃허브 푸시 하셨어영?"
        
        levelLabel.text = "LV\(damagochi.level) . 밥알 \(damagochi.meal)개 . 물방울 \(damagochi.water)개"
        
       
        mealFeedView.feedDelegate = self
        waterFeedView.feedDelegate = self
    }
    
    private func configureLayout() {
        
        damagochiView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.height.equalTo(damagochiView.snp.width).multipliedBy(1.2)
        }
        
        bubbleImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.bottom.equalTo(damagochiView.snp.top)
        }
        
        bubbleLabel.snp.makeConstraints { make in
            make.top.equalTo(bubbleImageView.snp.top).inset(16)
            make.horizontalEdges.equalTo(bubbleImageView.snp.horizontalEdges).inset(16)
            make.bottom.equalTo(bubbleImageView.snp.bottom).inset(32)
        }
        
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(damagochiView.snp.bottom).offset(8)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        mealFeedView.snp.makeConstraints { make in
            make.top.equalTo(levelLabel.snp.bottom).offset(16)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.height.equalTo(30)
        }
        
        waterFeedView.snp.makeConstraints { make in
            make.top.equalTo(mealFeedView.snp.bottom).offset(16)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.height.equalTo(30)
        }
    }

    private func configureNavigationBar() {
        guard let name = UserData.name else { return }
        self.navigationController?.navigationBar.tintColor = .fontAndBorderColor
        
        let settingItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(pushSettingVC))
        
        
        navigationItem.title = "\(name)님의 다마고치"
        navigationItem.leftBarButtonItem = .none
        navigationItem.rightBarButtonItem = settingItem
    }
}
