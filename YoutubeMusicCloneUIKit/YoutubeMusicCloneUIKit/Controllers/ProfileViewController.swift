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
