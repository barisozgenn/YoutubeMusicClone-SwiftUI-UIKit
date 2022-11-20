//
//  RegisterController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 19.11.2022.
//

import UIKit

class RegisterController: UIViewController {
    
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
        
        addGradientBackgroundLayer(height: view.height)
        
        view.addSubview(photoButton)
        photoButton.centerX(inView: view,
                            topAnchor: view.safeAreaLayoutGuide.topAnchor,
                            paddingTop: 70)
        photoButton.setDimensions(height: 92, width: 92)
        
        
        let stackView = UIStackView(arrangedSubviews: [nameTextField,
                                                       emailTextField,
                                                       passwordTextField,
                                                       passwordRepeatTextField,
                                                       registerButton])
        stackView.axis = .vertical
        stackView.spacing = 14
        
        view.addSubview(stackView)
        stackView.anchor(top: photoButton.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 58,
                         paddingLeft: 29,
                         paddingRight: 29)
        
        view.addSubview(loginButton)
        loginButton.centerX(inView: view)
        loginButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    func setNotificationObservers(){
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordRepeatTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    // MARK: - Properties
    private var viewModel = RegisterViewModel()
    
    private lazy var photoButton: UIButton = {
        let button = UIButton(type: .system)
        button.imageView?.contentMode = .scaleAspectFill
        button.backgroundColor = .black
        button.tintColor = .white
        button.setImage(UIImage(systemName: "photo.on.rectangle.angled"), for: .normal)
        button.addTarget(self, action: #selector(didTapPhoto), for: .touchUpInside)
        button.layer.cornerRadius = 46
        button.layer.borderColor = UIColor.gray.withAlphaComponent(0.29).cgColor
        button.layer.borderWidth = 2
        return button
    }()
    
    private let nameTextField: UITextField = CustomTextField(placeHolder: "Name")
    
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
    
    private let passwordRepeatTextField: UITextField = {
        let tf = CustomTextField(placeHolder: "Password repeat")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("SIGN UP".uppercased(), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = viewModel.buttonBackgroundColor
        button.layer.cornerRadius = 4
        button.setHeight(55)
        button.isEnabled = viewModel.formIsValid
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(reqularText: "You have an account?  ", boldText: "Sign In")
        
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    @objc func didTapLogin(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapRegister(){
        
    }
    
    @objc func didTapPhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        } else if sender == nameTextField {
            viewModel.name = sender.text
        } else if sender == passwordRepeatTextField {
            viewModel.passwordRepeat = sender.text
        }
        
        updateForm()
    }
}

// MARK: - Form ViewModel Protocol
extension RegisterController: FormViewModelProtocol {
    func updateForm() {
        registerButton.backgroundColor = viewModel.buttonBackgroundColor
        registerButton.isEnabled = viewModel.formIsValid
        registerButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    }
}

// MARK: - ImagePicker Delegates
extension RegisterController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.editedImage] as? UIImage else {return}
        
        photoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        photoButton.layer.borderColor = UIColor.red.withAlphaComponent(0.58).cgColor
        photoButton.layer.masksToBounds = true
        
        self.dismiss(animated: true, completion: nil)
    }
}
