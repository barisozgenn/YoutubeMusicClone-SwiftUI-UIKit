//
//  CategoryCell.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 19.11.2022.
//
import UIKit

class CategoryCell: UICollectionViewCell{
    //MARK: - Properties

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Category Name".capitalized
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .darkGray.withAlphaComponent(0.29)
        layer.borderWidth = 1
        layer.borderColor = CGColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.29)
        layer.cornerRadius = 14
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          paddingTop: 0,
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

