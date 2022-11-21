//
//  LibraryViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit
class LibraryViewController : MainViewController {
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Helpers
    override func addBackgroundTopColor() {
        addGradientBackgroundLayer(bgColor: .systemMint)
    }
    
    func setupUI(){
        view.addSubview(titleListenAgainLabel)
        titleListenAgainLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                     left: view.leftAnchor,
                                     paddingTop: 29,
                                     paddingLeft: 14)
        titleListenAgainLabel.setDimensions(height: 35, width: view.width - 80)
        
        view.addSubview(moreButton)
        moreButton.centerY(inView: titleListenAgainLabel,
                           leftAnchor: titleListenAgainLabel.rightAnchor,
                           paddingLeft: 29)
        moreButton.setDimensions(height: 28, width: 24)
        
        view.addSubview(listenAgainMusicCollectionView.view)
        listenAgainMusicCollectionView.view.anchor(top: titleListenAgainLabel.bottomAnchor,
                                                   left: view.leftAnchor,
                                                   paddingTop: 5,
                                                   paddingLeft: 14)
        listenAgainMusicCollectionView.view.setDimensions(height: 229,
                                                          width: view.width - 14)
        
        view.addSubview(menuCollectionView.view)
        menuCollectionView.view.anchor(top: listenAgainMusicCollectionView.view.bottomAnchor,
                                       left: view.leftAnchor,
                                       paddingTop: 29,
                                       paddingLeft: 14,
                                       paddingBottom: 58,
                                       width: view.width - 28,
                                       height: 300)
    }
    
    
    //MARK: - Properties
    
    private lazy var titleListenAgainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Recent activity"
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        button.backgroundColor = .clear
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
        musicCollectionView.cellWidth = 150
        return musicCollectionView
    }()
    
    private lazy var layoutMenu: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 2
        return layout
    }()
    
    private lazy var menuCollectionView: MenuCollectionViewController = {
        let menuCollectionView = MenuCollectionViewController(collectionViewLayout: layoutMenu)
        menuCollectionView.chevronVisibility = true
        return menuCollectionView
    }()
    
}
