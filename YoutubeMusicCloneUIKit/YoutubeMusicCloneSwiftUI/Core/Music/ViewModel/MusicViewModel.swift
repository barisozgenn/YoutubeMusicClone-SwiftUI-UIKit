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
    private let dataService = MusicService.shared
    @Published var musics : [MusicModel] = []
    @Published var selectedMusic: MusicModel?
    @Published var headerCategories: [String] = []
    
    init(){
        headerCategories = fetchCategories()
        fetchData()
    }
    // MARK: - API
    private func fetchData(){
        musics = dataService.musics
    }
    func downloadImage(music: MusicModel,completion: @escaping(_ image: UIImage) -> ()) {
        let ref = Storage.storage().reference(withPath: "\(FirebaseFileType.musicImage.folderName)\(music.imageUrl)")
        
        ref.getData(maxSize: 1 * 1024 * 1024) { data, _ in
            
            guard let data = data,
                  let uiImage = UIImage(data: data) else {
                completion(UIImage(named: "youtube-music-app-clone-logo")!)
                return
            }
            
             completion(uiImage)
        }
    }
    
   private func fetchCategories() -> [String] {
        return ["relax","energize","focus","workout","commute","baris","ozgen"]
    }
}
