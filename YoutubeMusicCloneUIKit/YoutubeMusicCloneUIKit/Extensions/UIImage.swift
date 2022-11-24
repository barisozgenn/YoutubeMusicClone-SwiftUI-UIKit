//
//  UIImage.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 24.11.2022.
//

import UIKit
extension UIImage {
    func blur(_ radius: Double) -> UIImage? {
        if let takenImage = CIImage(image: self) {
            return UIImage(ciImage: takenImage.applyingGaussianBlur(sigma: radius))
        }
        return nil
    }
}
