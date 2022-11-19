//
//  MusicRectCell.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 19.11.2022.
//
import UIKit

class MusicRectCell: UICollectionViewCell{
    //MARK: - Properties
    
    private let musicImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "AppIcon")
        iv.backgroundColor = .black
        iv.layer.cornerRadius = 4
        
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Music title is here will be shown".capitalized
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(musicImageView)
        musicImageView.anchor(top: topAnchor,
                              left: leftAnchor,
                              paddingTop: 10,
                              paddingLeft: 0)
        musicImageView.setDimensions(height: 120, width: 120)
        //musicImageView.layer.cornerRadius = 32
        
        
        addSubview(titleLabel)
        titleLabel.anchor(top: musicImageView.bottomAnchor,
                          left: musicImageView.leftAnchor,
                          right: rightAnchor,
                          paddingTop: 7,
                          paddingLeft: 0,
                          paddingRight: 0
        )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func didTapAstist(){
        print("DEBUG: artist profile button pressed")
    }
    
    @objc func didTapDetail(){
        print("DEBUG: detail bottom page button pressed")
    }
}
