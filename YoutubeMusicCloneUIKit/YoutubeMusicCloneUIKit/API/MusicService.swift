//
//  MusicService.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 22.11.2022.
//

import Foundation
import Combine

class MusicService {
    lazy var musics = [MusicModel]()
    
    init() {
        guard let musics = Bundle.main.readFromLocalFile(fileName: "musics.json") as? [MusicModel] else {return}
        self.musics = musics
    }
    
}
