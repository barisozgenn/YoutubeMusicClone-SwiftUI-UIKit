//
//  MusicViewModel.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 20.12.2022.
//

import Firebase
class MusicViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var musics: [MusicModel] = []
    @Published var selectedMusic: MusicModel = nil
    
    // MARK: - API
    
    
    func downloadImage(completion: @escaping(_ image: UIImage) -> ()) {
        let ref = Storage.storage().reference(withPath: "\(FirebaseFileType.musicImage.folderName)\(music.imageUrl)")
        
        ref.getData(maxSize: 1 * 1024 * 1024) { data, _ in
            
            guard let data = data,
                  let uiImage = UIImage(data: data) else {return}
            
             completion(uiImage)
        }
    }
}
