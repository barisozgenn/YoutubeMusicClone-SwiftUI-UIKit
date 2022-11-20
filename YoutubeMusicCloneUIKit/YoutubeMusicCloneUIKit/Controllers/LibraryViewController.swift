//
//  LibraryViewController.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit
class LibraryViewController : MainViewController {
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Helpers
    override func addBackgroundTopColor() {
        addGradientBackgroundLayer(bgColor: .systemMint)
    }
}
