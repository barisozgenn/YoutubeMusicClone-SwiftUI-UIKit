//
//  Color.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 18.11.2022.
//

import UIKit
import SwiftUI
extension UIColor{
    static let theme = ColorTheme()
    struct ColorTheme{
        let tabBarBackgroundColor = UIColor(named: "TabBarBackgroundColor")
        let appBackgroundColor = UIColor(named: "AppBackgroundColor")
    }
}
extension Color{
    static let theme = ColorTheme()
    struct ColorTheme{
        let tabBarBackgroundColor = Color("TabBarBackgroundColor")
        let appBackgroundColor = Color("AppBackgroundColor")
    }
}
