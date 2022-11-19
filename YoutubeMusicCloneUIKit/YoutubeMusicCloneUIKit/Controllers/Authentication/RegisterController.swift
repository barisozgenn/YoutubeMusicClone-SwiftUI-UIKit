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
    }
    
    // MARK: - Helpers
    func setupUI(){
        view.backgroundColor = .purple
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Properties
    
}
