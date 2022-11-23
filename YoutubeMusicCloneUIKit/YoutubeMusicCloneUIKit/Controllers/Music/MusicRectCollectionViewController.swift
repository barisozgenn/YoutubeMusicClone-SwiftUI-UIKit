//
//  MusicRectCollectionViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 19.11.2022.
//


import UIKit

private let reuseIdentifier = "MusicRectCell"

class MusicRectCollectionViewController: UICollectionViewController {
    //MARK: - Properties
    
    var musicsDataSource: [MusicModel]? {
        didSet { collectionView.reloadData() }
    }
    
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
    
    //MARK: - Properties
    
    lazy var cellWidth: CGFloat = 120
}

//MARK: - UICollectionViewDataSource
extension MusicRectCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicsDataSource?.count ?? 10
    }
  
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MusicRectCell
        if let musics = musicsDataSource {
            cell.viewModel = MusicViewModel(music: musics[indexPath.item])
        }
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension MusicRectCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellWidth + 35)
    }
}

