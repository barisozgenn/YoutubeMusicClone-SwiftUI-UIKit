//
//  MusicRectCollectionViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 19.11.2022.
//


import UIKit

private let reuseIdentifier = "MusicRectCell"

class MusicRectCollectionViewController: UICollectionViewController {
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    //MARK: - Helpers
    
    func setupUI(){
        collectionView.backgroundColor = .clear
        self.collectionView!.register(MusicRectCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
    }
}

//MARK: - UICollectionViewDataSource
extension MusicRectCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
  
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MusicRectCell
       
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension MusicRectCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 150)
    }
}

