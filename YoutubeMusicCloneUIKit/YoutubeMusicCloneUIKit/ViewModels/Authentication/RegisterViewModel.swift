//
//  RegisterViewModel.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 20.11.2022.
//

import UIKit

struct RegisterViewModel : AuthenticationViewModelProtocol {
    var email: String?
    var password: String?
    var name: String?
    var passwordRepeat: String?
    
    var formIsValid: Bool {
        guard let email = email,
              let password = password,
              let passwordRepeat = passwordRepeat,
              let name = name else {return false}
        
        if password.count < 6 || password != passwordRepeat || name.count < 2 {return false}
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? .systemRed.withAlphaComponent(0.7) : .systemRed.withAlphaComponent(0.14)
    }
    var buttonTitleColor: UIColor {
        return formIsValid ? .white: .white.withAlphaComponent(0.58)
    }
}
