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
        view.addSubview(headerView)
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          paddingTop: 29,
                          paddingLeft: 14,
                          height: 35)

        view.addSubview(listenAgainMusicCollectionView.view)
        listenAgainMusicCollectionView.view.anchor(top: headerView.bottomAnchor,
                                                   left: view.leftAnchor,
                                                   paddingTop: 5,
                                                   paddingLeft: 14)
        listenAgainMusicCollectionView.view.setDimensions(height: 240,
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
    
    private lazy var headerView: MusicHeader = MusicHeader(title: "Recent activity", headerButtonType: .chevron, headerWidth: view.width)

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
        musicCollectionView.musicsDataSource = musics.sorted(by: {$0.title > $1.title})
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
