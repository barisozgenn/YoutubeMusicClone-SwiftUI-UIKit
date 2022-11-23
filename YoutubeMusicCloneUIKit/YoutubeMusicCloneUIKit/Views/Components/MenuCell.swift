//
//  MenuCell.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 21.11.2022.
//
import UIKit

class MenuCell: UICollectionViewCell{
    //MARK: - Properties
    var viewModel: MenuViewModel? {
        didSet { setupUI() }
    }
    
    private let menuImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(systemName: "circle")
        iv.tintColor = .white
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Menu Name".capitalized
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 1
        return label
    }()
    
    private let menuDetailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(systemName: "chevron.right")
        iv.tintColor = .white
        return iv
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(menuImageView)
        menuImageView.anchor(top: topAnchor,
                              left: leftAnchor,
                              paddingTop: 8,
                              paddingLeft: 0)
        menuImageView.setDimensions(height: 24, width: 24)
        
        addSubview(titleLabel)
        titleLabel.centerY(inView: menuImageView,
                           leftAnchor: menuImageView.rightAnchor,
                           paddingLeft: 29)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func setupUI(){
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title
        menuImageView.image = UIImage(systemName: viewModel.systemImage)
        
        if viewModel.chevronVisibility {
            addSubview(menuDetailImageView)
            menuDetailImageView.centerY(inView: menuImageView,
                                        leftAnchor: rightAnchor,
                               paddingLeft: -20)
            menuDetailImageView.setDimensions(height: 24, width: 24)
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

