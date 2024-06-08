//
//  MainViewController.swift
//  Tamagochi
//
//  Created by 최승범 on 6/7/24.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    private let bubbleImageView = UIImageView()
    private let bubbleLabel = UILabel(fontSize: 15)
    private let tamagochiView = TamagochiView()
    private let levelLabel = UILabel(fontSize: 15)
    private let mealFeedView = FeedView(feedType: .meal)
    private let waterFeedView = FeedView(feedType: .water)
    
    private var tamagochi: TamagochiModel {
        didSet {
            levelLabel.text = "LV\(tamagochi.level) . 밥알 \(tamagochi.meal)개 . 물방울 \(tamagochi.water)개"
            tamagochiView.updateContent(data: tamagochi)
            bubbleLabel.text = randomBubble()
            UserData.saveTamagochi(value: tamagochi)
        }
    }
    
    init(tamagochi: TamagochiModel) {
        self.tamagochi = tamagochi
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
    
    private func randomBubble() -> String {
        
        guard let name = UserData.name else { return "히익!"}
        
        let bubbleContents = [
            "\(name)님 오늘 깃허브 푸시 하셨어영?",
            "\(name)님, 밥주세요",
            "\(name)님, 좋은 하루에요",
            "\(name)님 공부하세요"
        ]
        
        return bubbleContents.randomElement()!
    }
}

//MARK: - FeedViewDelegate
extension MainViewController: FeedViewDelegate {
    
    func feedingWater(value: Int) {
        tamagochi.water += value
    }
    
    func feedingMeal(value: Int) {
        tamagochi.meal += value
    }
    
}

//MARK: - configuration

extension MainViewController {
    
    private func configureHierachy() {
    
        view.addSubview(tamagochiView)
        view.addSubview(bubbleImageView)
        view.addSubview(bubbleLabel)
        view.addSubview(levelLabel)
        view.addSubview(mealFeedView)
        view.addSubview(waterFeedView)
      
    }
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundColor

        configureNavigationBar()
        
        tamagochiView.updateContent(data: tamagochi)
        
        bubbleImageView.image = UIImage(resource: .bubble)
        bubbleImageView.contentMode = .scaleAspectFill
        bubbleLabel.numberOfLines = .zero
        bubbleLabel.textAlignment = .center
        
        
        bubbleLabel.text = randomBubble()
        
        levelLabel.text = "LV\(tamagochi.level) . 밥알 \(tamagochi.meal)개 . 물방울 \(tamagochi.water)개"
        
        mealFeedView.feedDelegate = self
        waterFeedView.feedDelegate = self
    }
    
    private func configureLayout() {
        
        tamagochiView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.height.equalTo(tamagochiView.snp.width).multipliedBy(1.2)
        }
        
        bubbleImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.bottom.equalTo(tamagochiView.snp.top)
        }
        
        bubbleLabel.snp.makeConstraints { make in
            make.top.equalTo(bubbleImageView.snp.top).inset(16)
            make.horizontalEdges.equalTo(bubbleImageView.snp.horizontalEdges).inset(16)
            make.bottom.equalTo(bubbleImageView.snp.bottom).inset(32)
        }
        
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(tamagochiView.snp.bottom).offset(8)
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
