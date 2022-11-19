//
//  CategoryCollectionViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 19.11.2022.
//


import UIKit

private let reuseIdentifier = "CategoryCell"

class CategoryCollectionViewController: UICollectionViewController {
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    //MARK: - Helpers
    
    lazy var categories = ["relax","energize","focus","workout","commute","baris","ozgen"]
    func setupUI(){
        collectionView.backgroundColor = .clear
        self.collectionView!.register(CategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

//MARK: - UICollectionViewDataSource
extension CategoryCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
  
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //let category = categories[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
       
        //cell.titleLabel.text = category
        
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension CategoryCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 35)
    }
}
