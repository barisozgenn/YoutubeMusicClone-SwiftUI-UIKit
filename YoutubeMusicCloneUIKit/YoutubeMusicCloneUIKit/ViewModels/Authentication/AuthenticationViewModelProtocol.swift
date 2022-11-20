//
//  AuthenticationViewModelProtocol.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 20.11.2022.
//

import UIKit

protocol AuthenticationViewModelProtocol {
    var formIsValid : Bool {get}
    var buttonBackgroundColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
}
