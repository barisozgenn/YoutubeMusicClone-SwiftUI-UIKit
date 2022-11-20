//
//  Date.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 20.11.2022.
//

import Firebase

extension Date {
    func toTimestamp() -> Timestamp {
        return Timestamp(date: self)
    }
}
