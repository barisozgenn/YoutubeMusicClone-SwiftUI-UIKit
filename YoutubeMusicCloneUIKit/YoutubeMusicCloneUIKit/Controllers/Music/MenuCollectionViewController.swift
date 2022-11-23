//
//  MenuCollectionViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 21.11.2022.
//

import UIKit

private let reuseIdentifier = "MenuCell"

class MenuCollectionViewController: UICollectionViewController {
    //MARK: - Properties
    
    var menusDataSource: [MenuModel]? {
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
        self.collectionView!.register(MenuCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
}

//MARK: - UICollectionViewDataSource
extension MenuCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menusDataSource?.count ?? 10
    }
  
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCell
        
        if let menus = menusDataSource {
            cell.viewModel = MenuViewModel(menu: menus[indexPath.item])
        }
        
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension MenuCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.width, height: 40)
    }
}

