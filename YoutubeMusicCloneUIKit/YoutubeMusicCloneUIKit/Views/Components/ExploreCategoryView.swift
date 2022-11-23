//
//  ExploreCategoryView.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 21.11.2022.
//


import UIKit
class ExploreCategoryView: UIView {
    
    //MARK: - Properties
    private lazy var menuImageView: UIImageView = {
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
        label.text = "baris ozgen"
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.numberOfLines = 2
        return label
    }()
    
    //MARK: - Lifecycle
    init(imageSystemName: String, title: String) {
        super.init(frame: .zero)
        
        setHeight(92)
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 4
        backgroundColor = UIColor.black.withAlphaComponent(0.58)
        
        
        addSubview(menuImageView)
        menuImageView.image = UIImage(systemName: imageSystemName)
        menuImageView.anchor(top: topAnchor, left: leftAnchor,
                             paddingTop: 7, paddingLeft: 7)
        menuImageView.setDimensions(height: 24, width: 24)
        
       
        
        addSubview(titleLabel)
        titleLabel.text = title
        titleLabel.anchor(top: menuImageView.bottomAnchor, left: menuImageView.leftAnchor,
                          paddingTop: 7, width: 107, height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
