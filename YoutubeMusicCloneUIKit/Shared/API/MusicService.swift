//
//  MusicService.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 22.11.2022.
//

import Foundation
import Combine

class MusicService {
    static let shared = MusicService()
    lazy var musics : [MusicModel] = []
    
    init() {
       fetch(forName: "musics")
    }
    private func fetch(forName fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode([MusicModel].self, from: data)
                    self.musics = jsonData
                } catch {
                    print("DEBUG: parsing json error:\(error)")
                }
            }
    }
}
