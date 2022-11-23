//
//  ProfileViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit
class ProfileViewController : UIViewController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Helpers
    func setupUI(){
        view.backgroundColor = UIColor.theme.appBackgroundColor
        addGradientBackgroundLayer(bgColor: UIColor.gray)
        
        view.addSubview(headerView)
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          width: view.safeAreaLayoutGuide.layoutFrame.width-50,
                          height: 44)
        
        view.addSubview(accountHeaderView)
        accountHeaderView.anchor(top: headerView.bottomAnchor,
                                 left: view.safeAreaLayoutGuide.leftAnchor,
                                 paddingTop: 29,
                                 width: view.safeAreaLayoutGuide.layoutFrame.width-92,
                                 height: 90)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: accountHeaderView.bottomAnchor,
                          left: view.leftAnchor,
                          paddingTop: 29,
                          paddingLeft: 14)
        
        view.addSubview(menuCollectionView.view)
        menuCollectionView.view.anchor(top: titleLabel.bottomAnchor,
                                       left: view.leftAnchor,
                                       paddingTop: 14,
                                       paddingLeft: 14,
                                       paddingBottom: 58,
                                       width: view.width - 28,
                                       height: 300)
        
        view.addSubview(policyAndTermsButton)
        policyAndTermsButton.centerX(inView: view,
                                     topAnchor: view.safeAreaLayoutGuide.bottomAnchor,
                                     paddingTop: -29)
    }
    
    //MARK: - Properties
    
    private lazy var headerView: UIView = {
        let header = UIView()
        //headerView.setDimensions(height: 35, width: view.width)
        
        header.addSubview(headerBackButton)
        headerBackButton.anchor(top: header.topAnchor,
                                left: header.leftAnchor,
                                paddingTop: 5,
                                paddingLeft: 14,
                                width: 35,
                                height: 35)
        
        
        header.addSubview(headerTitleLabel)
        headerTitleLabel.centerY(inView: headerBackButton,
                                 leftAnchor: headerBackButton.rightAnchor,
                                 paddingLeft: 29)
        
        
        header.addSubview(headerSignOutButton)
        headerSignOutButton.setDimensions(height: 44, width: 75)
        headerSignOutButton.anchor(top: header.topAnchor,
                                   right: header.rightAnchor)
        
        return header
    }()
    
    private lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Account".capitalized
        label.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        return label
    }()
    
    private lazy var headerBackButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("X", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 29, weight: .thin)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerSignOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign out", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(didTapSignOut), for: .touchUpInside)
        return button
    }()
    
    private lazy var accountProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "profile-photo"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Baris Ozgen".capitalized
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var accountUsernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "@barisozgen"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var accountManageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Manage your Google account", for: .normal)
        button.titleLabel?.textAlignment = .left;
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var accountHeaderView: UIView = {
        let headerAccount = UIView()
        //headerView.setDimensions(height: 35, width: view.width)
        
        headerAccount.addSubview(accountProfileButton)
        accountProfileButton.anchor(top: headerAccount.topAnchor,
                                    left: headerAccount.leftAnchor,
                                    paddingTop: 0,
                                    paddingLeft: 14,
                                    width: 48,
                                    height: 48)
        
        let stackView = UIStackView(arrangedSubviews: [accountNameLabel, accountUsernameLabel, accountManageButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        
        headerAccount.addSubview(stackView)
        stackView.anchor(top: headerAccount.topAnchor,
                         left: accountProfileButton.rightAnchor,
                         paddingLeft: 14,
                         width: 250,
                         height: 80)
        stackView.spacing = 1
        stackView.setCustomSpacing(14, after: accountUsernameLabel)
        return headerAccount
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "youtube premium".uppercased()
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var layoutMenu: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 2
        return layout
    }()
    
    private lazy var menuCollectionView: MenuCollectionViewController = {
        let menuCollectionView = MenuCollectionViewController(collectionViewLayout: layoutMenu)
        return menuCollectionView
    }()
    
    private lazy var policyAndTermsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Privacy Policy  .  Terms Of Service", for: .normal)
        button.titleLabel?.textAlignment = .center;
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    //MARK: - Actions
    @objc func didTapBack(){
        //self.view.window!.rootViewController?.dismiss(animated: true)
        self.dismiss(animated: true)
    }
    
    @objc func didTapSignOut(){
        DispatchQueue.main.async{
            // Create the alert controller
            let alertController = UIAlertController(title: "Log Out?", message: "Are you sure you want to log out?", preferredStyle: .alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "Log Out", style: UIAlertAction.Style.default) {
                UIAlertAction in
                
                AuthService.shared.signOut()
                
                let controller = LoginController()
                let nav =  UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
                UIAlertAction in
                
                self.dismiss(animated: true)
            }
            
            // Add the actions
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            // Present the controller
            self.present(alertController, animated: true)
        }
        
    }
}
