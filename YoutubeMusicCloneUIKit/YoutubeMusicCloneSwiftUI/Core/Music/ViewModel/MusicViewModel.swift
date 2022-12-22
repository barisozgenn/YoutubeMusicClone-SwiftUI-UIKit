//
//  MusicViewModel.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 20.12.2022.
//

import Firebase
import UIKit
import FirebaseStorage

class MusicViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var selectedMusic: MusicModel?
    
    // MARK: - API
    
    func downloadImage(music: MusicModel,completion: @escaping(_ image: UIImage) -> ()) {
        let ref = Storage.storage().reference(withPath: "\(FirebaseFileType.musicImage.folderName)\(music.imageUrl)")
        
        ref.getData(maxSize: 1 * 1024 * 1024) { data, _ in
            
            guard let data = data,
                  let uiImage = UIImage(data: data) else {return}
            
             completion(uiImage)
        }
    }
}
