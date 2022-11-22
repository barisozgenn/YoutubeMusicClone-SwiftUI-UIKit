//
//  MusicCollectionViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit

private let reuseIdentifier = "MusicCell"
private let reuseHeaderIdentifier = "MusicHeaderView"

class MusicCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    //lazy var headerTitle: String = "baris"
    //lazy var headerButtonType: MusicHeader.HeaderButtonType = .none
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    //MARK: - Helpers
    
    func setupUI(){
        collectionView.backgroundColor = .clear
        collectionView.register(MusicCell.self, forCellWithReuseIdentifier: reuseIdentifier)
       // collectionView.register(MusicHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIdentifier)
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
    
    /*override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseHeaderIdentifier, for: indexPath) as! MusicHeader
        header.title = headerTitle
        header.headerButtonType = headerButtonType
        
        return header
    }*/
}
//MARK: - UICollectionViewDelegateFlowLayout
extension MusicCollectionViewController: UICollectionViewDelegateFlowLayout {
    // we can define all of them in externally called layout: UICollectionViewFlowLayout 
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 50, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 35)
    }*/
}
