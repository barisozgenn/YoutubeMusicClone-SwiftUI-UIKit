//
//  ExploreViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit
class ExploreViewController : MainViewController {
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    //MARK: - Helpers
    override func addBackgroundTopColor() {
        addGradientBackgroundLayer(bgColor: .systemOrange)
    }
    
    func setupUI(){
        view.addSubview(headerStackView)
        headerStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                               left: view.leftAnchor,
                               paddingTop: 14,
                               paddingLeft: 14,
                               width: view.safeAreaLayoutGuide.layoutFrame.width - 50 ,
                               height: 92)
        headerStackView.spacing = 29
        
        view.addSubview(titleListenAgainLabel)
        titleListenAgainLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                     left: view.leftAnchor,
                                     paddingTop: 129,
                                     paddingLeft: 14)
        
        titleListenAgainLabel.setDimensions(height: 35, width: view.width - 80)
        
        view.addSubview(moreButton)
        moreButton.centerY(inView: titleListenAgainLabel,
                           leftAnchor: titleListenAgainLabel.rightAnchor,
                           paddingLeft: 2)
        moreButton.setDimensions(height: 28, width: 55)
        
        view.addSubview(listenAgainMusicCollectionView.view)
        listenAgainMusicCollectionView.view.anchor(top: titleListenAgainLabel.bottomAnchor,
                                                   left: view.leftAnchor,
                                                   paddingTop: -20,
                                                   paddingLeft: 14)
        listenAgainMusicCollectionView.view.setDimensions(height: 240,
                                                          width: view.width - 14)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: listenAgainMusicCollectionView.view.bottomAnchor,
                          left: view.leftAnchor,
                          paddingTop: 29,
                          paddingLeft: 14,
                          width: view.width - 80
        )
        
        view.addSubview(moreTopSongsButton)
        moreTopSongsButton.centerY(inView: titleLabel,
                                   leftAnchor: titleLabel.rightAnchor,
                                   paddingLeft: 2)
        moreTopSongsButton.setDimensions(height: 28, width: 55)
        
        view.addSubview(quickPickMusicCollectionView.view)
        quickPickMusicCollectionView.view.anchor(top: titleLabel.bottomAnchor,
                                                 left: view.leftAnchor,
                                                 paddingTop: 10,
                                                 paddingLeft: 14)
        quickPickMusicCollectionView.view.setDimensions(height: 300,
                                                        width: view.width - 14)
        
    }
    //MARK: - Properties
    
    private lazy var titleListenAgainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "New albums & singles"
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("more".capitalized, for: .normal)
        button.titleLabel?.lineBreakMode = .byCharWrapping;
        button.titleLabel?.textAlignment = .center;
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        button.backgroundColor = .clear
        button.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 14
        return button
    }()
    
    private lazy var layoutRect: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 2
        return layout
    }()
    
    private lazy var listenAgainMusicCollectionView: MusicRectCollectionViewController = {
        let musicCollectionView = MusicRectCollectionViewController(collectionViewLayout: layoutRect)
        musicCollectionView.cellWidth = 158
        return musicCollectionView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Top songs"
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        return layout
    }()
    
    private lazy var quickPickMusicCollectionView: MusicCollectionViewController = {
        let musicCollectionView = MusicCollectionViewController(collectionViewLayout: layout)
        return musicCollectionView
    }()
    
    private lazy var moreTopSongsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("more".capitalized, for: .normal)
        button.titleLabel?.lineBreakMode = .byCharWrapping;
        button.titleLabel?.textAlignment = .center;
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        button.backgroundColor = .clear
        button.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 14
        return button
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            ExploreCategoryView(imageSystemName: "music.quarternote.3", title: "New releases"),
            ExploreCategoryView(imageSystemName: "chart.line.uptrend.xyaxis", title: "Charts"),
            ExploreCategoryView(imageSystemName: "face.smiling", title: "Moods & genres")])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
}
