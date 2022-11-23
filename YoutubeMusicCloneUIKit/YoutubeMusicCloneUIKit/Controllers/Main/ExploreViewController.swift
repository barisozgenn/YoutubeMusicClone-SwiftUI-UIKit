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
                               paddingTop: 29,
                               paddingLeft: 14,
                               width: view.safeAreaLayoutGuide.layoutFrame.width - 28,
                               height: 92)
        headerStackView.spacing = 14
        
        view.addSubview(headerView)
        headerView.anchor(top: headerStackView.bottomAnchor, left: headerStackView.leftAnchor, paddingTop: 29, height: 35)
        
        view.addSubview(listenAgainMusicCollectionView.view)
        listenAgainMusicCollectionView.view.anchor(top: headerView.bottomAnchor,
                                                   left: view.leftAnchor,
                                                   paddingTop: -20,
                                                   paddingLeft: 14)
        listenAgainMusicCollectionView.view.setDimensions(height: 240,
                                                          width: view.width - 14)
        
        view.addSubview(headerViewTopSongs)
        headerViewTopSongs.anchor(top: listenAgainMusicCollectionView.view.bottomAnchor, left: headerStackView.leftAnchor, paddingTop: 29, height: 35)
        
        view.addSubview(quickPickMusicCollectionView.view)
        quickPickMusicCollectionView.view.anchor(top: headerViewTopSongs.bottomAnchor,
                                                 left: view.leftAnchor)
        quickPickMusicCollectionView.view.setDimensions(height: 270,
                                                        width: view.width - 14)
        
    }
    //MARK: - Properties
    private lazy var headerView: MusicHeader = MusicHeader(title: "New albums & singles", headerButtonType: .more, headerWidth: view.width)

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
        musicCollectionView.musicsDataSource = musics.reversed()
        return musicCollectionView
    }()
    
    private lazy var headerViewTopSongs: MusicHeader = MusicHeader(title: "Top songs", headerButtonType: .more, headerWidth: view.width)

    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 14.0, left: 14.0, bottom: 0.0, right: 0.0)
        layout.itemSize = CGSize(width: view.frame.width - 50, height: 60)
        return layout
    }()
    
    private lazy var quickPickMusicCollectionView: MusicCollectionViewController = {
        let musicCollectionView = MusicCollectionViewController(collectionViewLayout: layout)
        musicCollectionView.musicsDataSource = musics
        return musicCollectionView
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            ExploreCategoryView(imageSystemName: "music.quarternote.3", title: "New releases"),
            ExploreCategoryView(imageSystemName: "chart.line.uptrend.xyaxis", title: "Charts"),
            ExploreCategoryView(imageSystemName: "face.smiling", title: "Moods & \ngenres")])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
}
