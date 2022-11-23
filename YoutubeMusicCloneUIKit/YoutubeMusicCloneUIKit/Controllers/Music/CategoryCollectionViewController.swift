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
    
    //MARK: - Properties
    
    lazy var categoriesDataSource = ["relax","energize","focus","workout","commute","baris","ozgen"]
    
    //MARK: - Helpers

    func setupUI(){
        collectionView.backgroundColor = .clear
        self.collectionView!.register(CategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
    }
}

//MARK: - UICollectionViewDataSource
extension CategoryCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesDataSource.count
    }
  
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //let category = categories[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
       
        let category = categoriesDataSource[indexPath.item]
        cell.title = category
        
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension CategoryCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = categoriesDataSource[indexPath.item]
        return CGSize(width: (item.count + 2) * 12, height: 40)
    }
}
