//
//  MusicViewModel.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 23.11.2022.
//
import FirebaseStorage
import UIKit

struct MusicViewModel {
    let music: MusicModel
    
    var title: String {return music.title}
    var artist: String {return music.artist}
    var minute: String {return Double(music.durationInSeconds).asStringInMinute(style: .positional)}
    var second: String {return String(music.durationInSeconds)}
    
    func downloadImage(completion: @escaping(_ image: UIImage) -> ()) {
        let ref = Storage.storage().reference(withPath: "\(FirebaseFileType.musicImage.folderName)\(music.imageUrl)")
        
        ref.getData(maxSize: 1 * 1024 * 1024) { data, _ in
            
            guard let data = data,
                  let uiImage = UIImage(data: data) else {return}
            
             completion(uiImage)
        }
    }
    
    init(music: MusicModel) {
        self.music = music
    }
}
