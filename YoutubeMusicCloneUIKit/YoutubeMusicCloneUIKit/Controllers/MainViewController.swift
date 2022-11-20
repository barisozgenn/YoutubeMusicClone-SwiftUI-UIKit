//
//  MainViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 20.11.2022.
//

import UIKit
class MainViewController: UIViewController {
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = UIColor.theme.appBackgroundColor
        addBackgroundTopColor()
        
        navigationItem.titleView = headerView
        headerView.setDimensions(height: 44, width: view.safeAreaLayoutGuide.layoutFrame.width-50)
    }
    
    func addBackgroundTopColor(){
        addGradientBackgroundLayer()
    }
    //MARK: - Properties
    
    private lazy var headerView: UIView = {
        let header = UIView()
        //headerView.setDimensions(height: 35, width: view.width)
        
        header.addSubview(headerLogoImageView)
        headerLogoImageView.anchor(top: header.topAnchor,
                                   left: header.leftAnchor,
                                   paddingTop: 15,
                                   width: 25,
                                   height: 25)
        
        
        header.addSubview(headerTitleLabel)
        headerTitleLabel.centerY(inView: headerLogoImageView,
                                 leftAnchor: headerLogoImageView.rightAnchor,
                                 paddingLeft: 4)
        
        let stackView = UIStackView(arrangedSubviews: [headerReflectButton, headerSearchButton, headerProfileButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        header.addSubview(stackView)
        stackView.anchor(top: headerLogoImageView.topAnchor,
                         right: header.rightAnchor,
                         paddingTop: -3,
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
    
}
