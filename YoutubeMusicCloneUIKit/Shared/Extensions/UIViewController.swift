//
//  UIViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit
//import JGProgressHUD

extension UIViewController {
    //static let hud = JGProgressHUD(style: .dark)
    
    func addGradientBackgroundLayer(height: CGFloat = 414, bgColor: UIColor = UIColor.systemRed, endColor: UIColor = UIColor.clear, opacity: Float = 0.58) {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: view.width, height: height)
        gradient.colors = [bgColor.cgColor, endColor.cgColor]
        gradient.opacity = opacity
        
        view.layer.insertSublayer(gradient, at: 0)
        //view.layer.addSublayer(gradient)
    }
    /*func showLoader(_ show: Bool) {
     view.endEditing(true)
     
     if show {
     UIViewController.hud.show(in: view)
     } else {
     UIViewController.hud.dismiss()
     }
     }*/
    
    func showMessage(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
