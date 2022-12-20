//
//  MusicModel.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 22.11.2022.
//

struct MusicModel: Identifiable, Codable {
    let id: String
    let title: String
    let artist: String
    let imageUrl: String
    let musicUrl: String
    let durationInSeconds: Int
}
