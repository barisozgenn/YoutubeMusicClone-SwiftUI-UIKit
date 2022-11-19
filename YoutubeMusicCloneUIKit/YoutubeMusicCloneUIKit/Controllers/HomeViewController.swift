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
        
        addGradientBackgroundLayer()
        
        view.addSubview(headerView)
        headerView.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
        paddingTop: 60)
        
        view.addSubview(categoryCollectionView.view)
        categoryCollectionView.view.anchor(top: headerView.bottomAnchor,
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
        quickPickMusicCollectionView.view.setDimensions(height: 300,
                                                        width: view.width - 14)
        
        
        view.addSubview(titleListenAgainLabel)
        titleListenAgainLabel.anchor(top: quickPickMusicCollectionView.view.bottomAnchor,
                                     left: view.leftAnchor,
                                     paddingTop: 29,
                                     paddingLeft: 14)
        titleListenAgainLabel.setDimensions(height: 35, width: view.width - 80)
        
        view.addSubview(moreButton)
        moreButton.centerY(inView: titleListenAgainLabel,
                           leftAnchor: titleListenAgainLabel.rightAnchor,
                           paddingLeft: 2)
        moreButton.setDimensions(height: 28, width: 55)
        
        view.addSubview(listenAgainMusicCollectionView.view)
        listenAgainMusicCollectionView.view.anchor(top: titleListenAgainLabel.bottomAnchor,
                                                   left: view.leftAnchor,
                                                   paddingTop: 5,
                                                   paddingLeft: 14)
        listenAgainMusicCollectionView.view.setDimensions(height: 329,
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
        let musicCollectionView = MusicCollectionViewController(collectionViewLayout: layout)
        return musicCollectionView
    }()
    
    private lazy var titleListenAgainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Listen again"
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("more".capitalized, for: .normal)
        button.titleLabel?.lineBreakMode = .byCharWrapping;
        button.titleLabel?.textAlignment = .center;
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        button.backgroundColor = .clear
        button.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(didTapMore), for: .touchUpInside)
        return button
    }()
    
    private lazy var layoutRect: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 2
        return layout
    }()
    
    private lazy var listenAgainMusicCollectionView: MusicRectCollectionViewController = {
        let musicCollectionView = MusicRectCollectionViewController(collectionViewLayout: layoutRect)
        return musicCollectionView
    }()
    
    private lazy var layoutCategory: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 2
        return layout
    }()
    
    private lazy var categoryCollectionView: CategoryCollectionViewController = {
        let categoryCollectionView = CategoryCollectionViewController(collectionViewLayout: layoutCategory)
        return categoryCollectionView
    }()
    
    private lazy var headerView: UIView = {
        let header = UIView()
        header.setDimensions(height: 35, width: view.width)
        
        header.addSubview(headerLogoImageView)
        headerLogoImageView.anchor(top: header.topAnchor,
                                    left: header.leftAnchor,
                                   paddingTop: 6,
                                    paddingLeft: 14,
                                   width: 25,
                                   height: 25)
        
        
        header.addSubview(headerTitleLabel)
        headerTitleLabel.centerY(inView: header,
                                 leftAnchor: headerLogoImageView.rightAnchor,
                                 paddingLeft: 4)
        
        let stackView = UIStackView(arrangedSubviews: [headerReflectButton, headerSearchButton, headerProfileButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        header.addSubview(stackView)
        stackView.anchor(top: header.topAnchor,
                         right: header.rightAnchor,
                         paddingRight: 14,
                         width: 130,
                         height: 30)
        stackView.spacing = 20
        
        return header
    }()
    
    private let headerLogoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(systemName: "play.circle")
        iv.backgroundColor = UIColor.systemRed
        iv.layer.borderWidth = 2
        iv.layer.borderColor = UIColor.systemRed.cgColor
        iv.layer.cornerRadius = 12
        iv.tintColor = .white
    
        return iv
    }()
    
    private lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "music".uppercased()
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        return label
    }()
    
    private lazy var headerSearchButton: UIButton = {
        let button = UIButton(type: .system)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.tintColor = .white
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        //button.addTarget(self, action: #selector(didTapX), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerReflectButton: UIButton = {
        let button = UIButton(type: .system)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.tintColor = .white
        button.setImage(UIImage(systemName: "dot.radiowaves.up.forward"), for: .normal)
        //button.addTarget(self, action: #selector(didTapX), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "profile-photo"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        //button.addTarget(self, action: #selector(didTapX), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    
    @objc func didTapMore(){
        print("DEBUG: more music button pressed")
    }
}
