//
//  HomeViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit

class HomeViewController : MainViewController {
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Helpers
    
    func setupUI(){
        view.addSubview(categoryCollectionView.view)
        categoryCollectionView.view.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                           left: view.leftAnchor,
                                           paddingTop: 14,
                                           paddingLeft: 14)
        categoryCollectionView.view.setDimensions(height: 50,
                                                  width: view.width - 14)
        
        view.addSubview(subtitleLabel)
        subtitleLabel.anchor(top: categoryCollectionView.view.bottomAnchor,
                             left: view.leftAnchor,
                             paddingTop: 14,
                             paddingLeft: 14)
        
        
        view.addSubview(headerView)
        headerView.anchor(top: subtitleLabel.bottomAnchor, left: subtitleLabel.leftAnchor, width: view.width, height: 35)
        
        view.addSubview(quickPickMusicCollectionView.view)
        quickPickMusicCollectionView.view.anchor(top: headerView.bottomAnchor,
                                                 left: view.leftAnchor)
        quickPickMusicCollectionView.view.setDimensions(height: 277,
                                                        width: view.width)
        
        
        view.addSubview(headerViewListenAgain)
        headerViewListenAgain.anchor(top: quickPickMusicCollectionView.view.bottomAnchor, left: subtitleLabel.leftAnchor, paddingTop: 29, height: 35)
        
        view.addSubview(listenAgainMusicCollectionView.view)
        listenAgainMusicCollectionView.view.anchor(top: headerViewListenAgain.bottomAnchor,
                                                   left: view.leftAnchor,
                                                   paddingTop: 5,
                                                   paddingLeft: 14)
        listenAgainMusicCollectionView.view.setDimensions(height: 329,
                                                          width: view.width - 14)
        
        
    }
    
    //MARK: - Properties
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "start radio from a song".uppercased()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    
    private lazy var headerView: MusicHeader = MusicHeader(title: "Quick picks", headerButtonType: .none, headerWidth: view.width)
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        //layout.sectionHeadersPinToVisibleBounds = true
        layout.sectionInset = UIEdgeInsets(top: 14.0, left: 14.0, bottom: 0.0, right: 0.0)
        // layout.headerReferenceSize = CGSize(width: view.frame.width, height: 35)
        layout.itemSize = CGSize(width: view.frame.width - 50, height: 60)
        return layout
    }()
    
    private lazy var quickPickMusicCollectionView: MusicCollectionViewController = {
        let musicCollectionView = MusicCollectionViewController(collectionViewLayout: layout)
        //musicCollectionView.headerTitle = "Quick picks"
        //musicCollectionView.headerButtonType = .none
        musicCollectionView.musicsDataSource = musics.sorted(by: {$0.durationInSeconds > $1.durationInSeconds})
        return musicCollectionView
    }()
    
    private lazy var headerViewListenAgain: MusicHeader = MusicHeader(title: "Listen again", headerButtonType: .more, headerWidth: view.width)
    
    private lazy var layoutRect: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 2
        return layout
    }()
    
    private lazy var listenAgainMusicCollectionView: MusicRectCollectionViewController = {
        let musicCollectionView = MusicRectCollectionViewController(collectionViewLayout: layoutRect)
        musicCollectionView.musicsDataSource = musics.sorted(by: {$0.durationInSeconds < $1.durationInSeconds})
        return musicCollectionView
    }()
    
    private lazy var layoutCategory: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 7
        return layout
    }()
    
    private lazy var categoryCollectionView: CategoryCollectionViewController = {
        let categoryCollectionView = CategoryCollectionViewController(collectionViewLayout: layoutCategory)
        return categoryCollectionView
    }()
    
    // MARK: - Actions
    
    @objc func didTapMore(){
        print("DEBUG: more music button pressed")
    }
    
}
