//
//  Constants.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 20.11.2022.
//

import FirebaseFirestore

let COLLECTION_USER_PROFILE = Firestore.firestore().collection("userProfile")
let COLLECTION_MUSIC = Firestore.firestore().collection("music")
let PLAY_MUSIC_VIEW_TAG = 992
let PLAY_MUSIC_VIEW_NOTIFICATION_NAME = "MusicDetailScreenNSNotification"
let TABBAR_NOTIFICATION_NAME = "TabBarVisibilityNSNotification"
