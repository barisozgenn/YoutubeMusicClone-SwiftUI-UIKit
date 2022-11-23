//
//  MusicBottomSheetController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 23.11.2022.
//

import UIKit
class MusicBottomSheetController: UIViewController {
    //MARK: - Properties
    
     var viewModel: MusicViewModel?
    
    private let musicImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        //iv.image = UIImage(named: "youtube-music-app-clone-logo")
        iv.backgroundColor = .gray.withAlphaComponent(0.58)
        iv.layer.cornerRadius = 4
        
        return iv
    }()
    
    private lazy var artistButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitle(" ".capitalized, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.titleLabel?.textAlignment = .left
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = " ".capitalized
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        button.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        return button
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        return button
    }()
    
    private lazy var layoutMenu: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 14.0, left: 29.0, bottom: 29.0, right: 29.0)
        return layout
    }()
    
    private lazy var menuCollectionView: MenuCollectionViewController = {
        let menuCollectionView = MenuCollectionViewController(collectionViewLayout: layoutMenu)
        menuCollectionView.menusDataSource = [
        MenuModel(title: "Start radio", systemImage: "dot.radiowaves.left.and.right", chevronVisibility: false),
        /*MenuModel(title: "Play next", systemImage: "text.line.first.and.arrowtriangle.forward", chevronVisibility: false),*/
        MenuModel(title: "Add to queue", systemImage: "text.line.last.and.arrowtriangle.forward", chevronVisibility: false),
        MenuModel(title: "Add to library", systemImage: "app.badge.checkmark", chevronVisibility: false),
        MenuModel(title: "Download", systemImage: "arrow.down.to.line", chevronVisibility: false),
        MenuModel(title: "Add to playlist", systemImage: "text.badge.plus", chevronVisibility: false),
        MenuModel(title: "Go to album", systemImage: "record.circle", chevronVisibility: false),
        MenuModel(title: "Go to artist", systemImage: "person.wave.2", chevronVisibility: false),
        MenuModel(title: "Share", systemImage: "arrowshape.turn.up.right", chevronVisibility: false)]
        return menuCollectionView
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Helpers
    
    func setupUI(){
        view.backgroundColor = UIColor.theme.tabBarBackgroundColor
        
        view.addSubview(musicImageView)
        musicImageView.anchor(top: view.topAnchor,
                              left: view.leftAnchor,
                              paddingTop: 14,
                              paddingLeft: 29)
        musicImageView.setDimensions(height: 48, width: 48)
        //musicImageView.layer.cornerRadius = 32
        
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: musicImageView.topAnchor,
                          left: musicImageView.rightAnchor,
                          right: view.rightAnchor,
                          paddingTop: 0,
                          paddingLeft: 14,
                          paddingRight: 29)
        
        view.addSubview(artistButton)
        artistButton.anchor(top: titleLabel.bottomAnchor,
                            left: musicImageView.rightAnchor,
                            paddingLeft: 14,
                            paddingRight: 29)
        
        guard let viewModel = viewModel else {return}
        titleLabel.text = viewModel.title
        artistButton.setTitle(viewModel.artist, for: .normal)
        
        viewModel.downloadImage {[weak self] image in
            self?.musicImageView.image = image
        }
        
        view.addSubview(likeButton)
        likeButton.centerY(inView: musicImageView,
                           leftAnchor: view.rightAnchor,
                             paddingLeft: -107)
        
        view.addSubview(closeButton)
        closeButton.centerY(inView: musicImageView,
                           leftAnchor: likeButton.rightAnchor,
                             paddingLeft: 29)
        
        view.addSubview(menuCollectionView.view)
        menuCollectionView.view.backgroundColor = .black.withAlphaComponent(0.14)
        menuCollectionView.view.anchor(top: musicImageView.bottomAnchor,
                                       left: view.leftAnchor,
                                       paddingTop: 14,
                                       paddingLeft: 0,
                                       paddingBottom: 0,
                                       width: view.width,
                                       height: 492)
    }
    
    //MARK: - Actions
    
    @objc func didTapClose(){
        dismiss(animated: true)
    }
    
    @objc func didTapLike(){
        likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
    }
}
