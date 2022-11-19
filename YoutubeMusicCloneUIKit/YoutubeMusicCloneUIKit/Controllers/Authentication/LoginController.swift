//
//  LoginController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 19.11.2022.
//
import UIKit

class LoginController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Helpers
    func setupUI(){
        view.backgroundColor = UIColor.theme.appBackgroundColor
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .default
        
        view.layer.insertSublayer(gradientBackground, at: 0)
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view,
                              topAnchor: view.safeAreaLayoutGuide.topAnchor,
                              paddingTop: 70)
        logoImageView.setDimensions(height: 64, width: 64)
        
        view.addSubview(headerTitleLabel)
        headerTitleLabel.centerX(inView: view,
                                 topAnchor: logoImageView.bottomAnchor,
                                 paddingTop: 14)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,
                                                       passwordTextField,
                                                       loginButton,
                                                       forgotPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 14
        
        view.addSubview(stackView)
        stackView.anchor(top: headerTitleLabel.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 58,
                         paddingLeft: 29,
                         paddingRight: 29)
        
        view.addSubview(registerButton)
        registerButton.centerX(inView: view)
        registerButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    // MARK: - Properties
    private lazy var gradientBackground: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height/2)
        gradient.colors = [UIColor.systemRed.cgColor, UIColor.clear.cgColor]
        gradient.opacity = 0.58
        
        return gradient
    }()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "youtube-music-app-clone-logo")
        
        return iv
    }()
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "music".uppercased()
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .white
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .black.withAlphaComponent(0.7)
        tf.keyboardAppearance = .dark
        tf.keyboardType = .emailAddress
        tf.setHeight(55)
        tf.attributedPlaceholder = NSAttributedString(string: "Email",
                                                      attributes: [.foregroundColor : UIColor.white.withAlphaComponent(0.7)])
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .white
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .black.withAlphaComponent(0.7)
        tf.keyboardAppearance = .dark
        tf.keyboardType = .default
        tf.setHeight(55)
        tf.attributedPlaceholder = NSAttributedString(string: "Password",
                                                      attributes: [.foregroundColor : UIColor.white.withAlphaComponent(0.7)])
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("LOG IN".uppercased(), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemRed.withAlphaComponent(0.29)
        button.layer.cornerRadius = 4
        button.setHeight(55)
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
       
        let attributesRegular : [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.white.withAlphaComponent(0.7), .font: UIFont.systemFont(ofSize: 16)]
        let attributesBold : [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.white.withAlphaComponent(0.92), .font: UIFont.boldSystemFont(ofSize: 16)]
        
        var attributedTitle = NSMutableAttributedString(string: "Don't you have an account?  ", attributes: attributesRegular)
        
        let attributedTitleBold = NSAttributedString(string: "Sign Up", attributes: attributesBold)
        attributedTitle.append(attributedTitleBold)
        
        button.setAttributedTitle(attributedTitle,for: .normal)
        
        button.setHeight(55)
        button.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
       
        let attributesRegular : [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.white.withAlphaComponent(0.7), .font: UIFont.systemFont(ofSize: 16)]
        let attributesBold : [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.white.withAlphaComponent(0.77), .font: UIFont.boldSystemFont(ofSize: 16)]
        
        var attributedTitle = NSMutableAttributedString(string: "Forgot password?  ", attributes: attributesRegular)
        
        let attributedTitleBold = NSAttributedString(string: "Get help signing in.", attributes: attributesBold)
        attributedTitle.append(attributedTitleBold)
        
        button.setAttributedTitle(attributedTitle,for: .normal)
        
        button.setHeight(55)
        button.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    
    @objc func didTapLogin(){
        print("DEBUG: login button pressed")
    }
    
    @objc func didTapRegister(){
        print("DEBUG: register button pressed")
    }
    
    @objc func didTapForgotPassword(){
        print("DEBUG: forgot password button pressed")
    }
}
