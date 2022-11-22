//
//  MusicHeader.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 22.11.2022.
//

import UIKit

class MusicHeader: UIView /*UICollectionReusableView*/ {
    
    //MARK: - Properties
    //lazy var title:String = "baris ozgen title"
    //lazy var headerButtonType: HeaderButtonType = .none
    
    enum HeaderButtonType {
        case more
        case chevron
        case none
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "baris ozgen title"
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
        return button
    }()
    
    private lazy var chevronButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        button.backgroundColor = .clear
        return button
    }()
    
    //MARK: - Lifecycle
    
    //override init(frame: CGRect) {
    init(title:String = "baris ozgen title", headerButtonType: HeaderButtonType = .none, headerWidth: CGFloat){
        super.init(frame: .zero)
        
        
        titleLabel.text = title
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          paddingTop: 4)
        titleLabel.setDimensions(height: 35, width: headerWidth - 77)
        
        switch headerButtonType {
        case .none: break
        case .more:
            addSubview(moreButton)
            moreButton.centerY(inView: titleLabel,
                               leftAnchor: titleLabel.rightAnchor,
                               paddingLeft: 2)
            moreButton.setDimensions(height: 28, width: 55)
            break
        case .chevron:
            addSubview(chevronButton)
            chevronButton.centerY(inView: titleLabel,
                               leftAnchor: titleLabel.rightAnchor,
                               paddingLeft: 2)
            chevronButton.setDimensions(height: 29, width: 55)
            break
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
