//
//  MusicRectCell.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 19.11.2022.
//
import UIKit

class MusicRectCell: UICollectionViewCell{
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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "  ".capitalized
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 2
        label.backgroundColor = .gray.withAlphaComponent(0.58)
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
        musicImageView.setDimensions(height: frame.width, width: frame.width)
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
    // MARK: - Helpers
    func setupUI(){
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title
        titleLabel.backgroundColor = .clear
        
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
