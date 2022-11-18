//
//  HomeViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit
class HomeViewController : UIViewController {
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Helpers
    
    func setupUI(){
        view.backgroundColor = UIColor.theme.appBackgroundColor
        
        view.addSubview(subtitleLabel)
        subtitleLabel.anchor(top: view.topAnchor,
                             left: view.leftAnchor,
                             paddingTop: 70,
                             paddingLeft: 14)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: subtitleLabel.bottomAnchor,
                             left: view.leftAnchor,
                             paddingTop: 4,
                             paddingLeft: 14)
        
        view.addSubview(quickPickMusicCollectionView.view)
        
        quickPickMusicCollectionView.view.anchor(top: titleLabel.bottomAnchor,
                                                 left: view.leftAnchor,
                                                 paddingTop: 10,
                                                 paddingLeft: 14)
        
        quickPickMusicCollectionView.view.setDimensions(height: 330,
                                                        width: view.width - 14)
        
        
    }
    
    //MARK: - Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Quick picks"
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "start radio from a song".uppercased()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
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
        let quickPickMusicCollectionView = MusicCollectionViewController(collectionViewLayout: layout)
        return quickPickMusicCollectionView
    }()
}
