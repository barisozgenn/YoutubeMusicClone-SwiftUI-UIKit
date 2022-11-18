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
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let quickPickMusicCollectionView = MusicCollectionViewController(collectionViewLayout: layout)
        
        self.view.addSubview(quickPickMusicCollectionView.view)
        
        quickPickMusicCollectionView.view.frame = CGRect(x: 14,
                                                              y: 100,
                                                              width: view.width - 28,
                                                              height: 350)
        
        
    }
}
