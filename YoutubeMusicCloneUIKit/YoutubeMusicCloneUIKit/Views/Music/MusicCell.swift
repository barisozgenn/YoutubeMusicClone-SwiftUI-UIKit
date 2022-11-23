//
//  MusicCell.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit

class MusicCell: UICollectionViewCell{
    //MARK: - Properties
    var viewModel: MusicViewModel? {
        didSet { setupUI() }
    }
    
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
        button.titleLabel?.backgroundColor = .gray.withAlphaComponent(0.58)
        button.addTarget(self, action: #selector(didTapAstist), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = " ".capitalized
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.backgroundColor = .gray.withAlphaComponent(0.58)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var detailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("⬤\n⬤\n⬤".capitalized, for: .normal)
        button.titleLabel?.lineBreakMode = .byCharWrapping;
        button.titleLabel?.textAlignment = .center;
        button.titleLabel?.font = UIFont.systemFont(ofSize: 4, weight: .regular)
        button.addTarget(self, action: #selector(didTapDetail), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(musicImageView)
        musicImageView.anchor(top: topAnchor,
                              left: leftAnchor,
                              paddingTop: 0,
                              paddingLeft: 0)
        musicImageView.setDimensions(height: 60, width: 60)
        //musicImageView.layer.cornerRadius = 32
        
        
        addSubview(titleLabel)
        titleLabel.anchor(top: musicImageView.topAnchor,
                          left: musicImageView.rightAnchor,
                          right: rightAnchor,
                          paddingTop: 7,
                          paddingLeft: 14,
                          paddingRight: 29
        )
        
        addSubview(artistButton)
        artistButton.anchor(top: titleLabel.bottomAnchor,
                            left: musicImageView.rightAnchor,
                            paddingLeft: 14,
                            paddingRight: 29)
        
        addSubview(detailButton)
        detailButton.centerY(inView: musicImageView,
                             leftAnchor: rightAnchor,
                             paddingLeft: -29)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func setupUI(){
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title
        artistButton.setTitle(viewModel.artist, for: .normal)
        
        titleLabel.backgroundColor = .clear
        artistButton.titleLabel?.backgroundColor = .clear
        
        viewModel.downloadImage {[weak self] image in
            self?.musicImageView.image = image
        }
    }
    // MARK: - Actions
    
    @objc func didTapAstist(){
        print("DEBUG: artist profile button pressed")
    }
    
    @objc func didTapDetail(){
        print("DEBUG: detail bottom page button pressed")
    }
}
