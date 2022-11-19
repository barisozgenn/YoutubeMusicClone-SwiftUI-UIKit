//
//  MusicCollectionViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit

private let reuseIdentifier = "MusicCell"

class MusicCollectionViewController: UICollectionViewController {
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    //MARK: - Helpers
    
    func setupUI(){
        collectionView.backgroundColor = .clear
        self.collectionView!.register(MusicCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
    }
}

//MARK: - UICollectionViewDataSource
extension MusicCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
  
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MusicCell
       
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension MusicCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 50, height: 70)
    }
}
