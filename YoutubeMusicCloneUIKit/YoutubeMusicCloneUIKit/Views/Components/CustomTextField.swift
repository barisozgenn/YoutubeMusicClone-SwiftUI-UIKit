//
//  CustomTextField.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 19.11.2022.
//

import UIKit
class CustomTextField: UITextField {
    
    init(placeHolder: String) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 55, width: 14)
        leftView = spacer
        leftViewMode = .always
        
        textColor = .white
        borderStyle = .roundedRect
        backgroundColor = .black.withAlphaComponent(0.7)
        keyboardAppearance = .dark
        setHeight(55)
        attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                      attributes: [.foregroundColor : UIColor.white.withAlphaComponent(0.7)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
