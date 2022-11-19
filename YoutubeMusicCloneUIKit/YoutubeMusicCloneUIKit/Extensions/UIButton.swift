//
//  UIButton.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit

extension UIButton {
    func attributedTitle(reqularText: String, boldText: String) {
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white.withAlphaComponent(0.7), .font: UIFont.systemFont(ofSize: 16)]
        let attributedTitle = NSMutableAttributedString(string: reqularText, attributes: attributes)
        
        let boldAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white.withAlphaComponent(0.92), .font: UIFont.boldSystemFont(ofSize: 16)]
        attributedTitle.append(NSAttributedString(string: boldText, attributes: boldAttributes))
        
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
