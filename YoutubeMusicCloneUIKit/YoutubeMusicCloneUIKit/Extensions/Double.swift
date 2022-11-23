//
//  Double.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 23.11.2022.
//

import Foundation

extension Double {
  func asStringInMinute(style: DateComponentsFormatter.UnitsStyle) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.minute, .second, .nanosecond]
    formatter.unitsStyle = style
    return formatter.string(from: self) ?? ""
  }
}
