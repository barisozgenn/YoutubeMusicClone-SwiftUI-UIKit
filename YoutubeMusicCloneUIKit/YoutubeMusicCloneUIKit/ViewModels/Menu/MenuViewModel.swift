//
//  MenuViewModel.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 23.11.2022.
//

import Foundation
struct MenuViewModel {
    let menu: MenuModel
    
    var title: String {return menu.title}
    var systemImage: String {return menu.systemImage}
    var chevronVisibility: Bool {return menu.chevronVisibility}
}
