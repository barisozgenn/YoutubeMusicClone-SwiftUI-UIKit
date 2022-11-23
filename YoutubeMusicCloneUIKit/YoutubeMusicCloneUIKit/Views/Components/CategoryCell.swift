//
//  CategoryCell.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 19.11.2022.
//
import UIKit

class CategoryCell: UICollectionViewCell{
    //MARK: - Properties
    var title: String? {
        didSet { setupUI() }
    }
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray.withAlphaComponent(0.29)
        layer.borderWidth = 1
        layer.borderColor = CGColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.29)
        layer.cornerRadius = 10
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          paddingTop: 9,
                          paddingLeft: 7,
                          paddingRight: 7)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func setupUI(){
        guard let title = title else { return }
        
        titleLabel.text = title.capitalized
        
    }
    // MARK: - Actions
    
    @objc func didTapAstist(){
        print("DEBUG: artist profile button pressed")
    }
    
    @objc func didTapDetail(){
        print("DEBUG: detail bottom page button pressed")
    }
}

