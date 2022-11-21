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
        setNotificationObservers()
    }
    
    // MARK: - Helpers
    func setupUI(){
        view.backgroundColor = UIColor.theme.appBackgroundColor
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .default
        
        addGradientBackgroundLayer(height: view.height/2)
        
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
    func setNotificationObservers(){
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    // MARK: - Properties
    private var viewModel = LoginViewModel()
    private let authService = AuthService.shared

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
        let tf = CustomTextField(placeHolder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeHolder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        button.setTitle("SIGN IN".uppercased(), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = viewModel.buttonBackgroundColor
        button.layer.cornerRadius = 4
        button.setHeight(55)
        button.isEnabled = viewModel.formIsValid
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(reqularText: "Don't you have an account?  ", boldText: "Sign Up")
        
        button.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(reqularText: "Forgot password?  ", boldText: "Get help signing in.")
        button.setHeight(55)
        
        button.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    @objc func didTapLogin(){
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {return}
        
        let authCreadential = AuthCredentials(email: email, password: password)
        // baris@test.YouTubeMusic.clone
        authService.loginUser(withCredential: authCreadential) {[weak self] (error, userProfile) in
            if let error = error {
              
                    let alert = UIAlertController(title: "OPPS!",
                                                  message: error.localizedDescription,
                                                  preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                        UIAlertAction in
                        alert.dismiss(animated: true)
                    }
                    alert.addAction(okAction)
                    
                    self?.present(alert, animated: true, completion: nil)
                    return
                
            }
            
            guard let userProfile = userProfile else{return}
            print("DEBUG: user logged in: \(userProfile.name)")
            self?.dismiss(animated: true)
            //self?.view.window!.rootViewController?.dismiss(animated: true)
        }
    }
    
    @objc func didTapRegister(){
        let viewController = RegisterController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func didTapForgotPassword(){
        print("DEBUG: forgot password button pressed")
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextField {
            viewModel.email = sender.text?.lowercased()
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        }
        
        updateForm()
    }
}

// MARK: - Form ViewModel Protocol
extension LoginController: FormViewModelProtocol {
    func updateForm() {
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.isEnabled = viewModel.formIsValid
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    }
}
