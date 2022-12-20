//
//  ImageUploadService.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 20.11.2022.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploadService {

    static func uploadImage(image: UIImage, imageUploadedType: FirebaseFileType, completion: @escaping(String, String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: imageUploadedType.compressValue) else {return}
        
        let fileName = imageUploadedType.createFileName()
        
        let ref = Storage.storage().reference(withPath: imageUploadedType.getFolderPath(fileName: fileName))
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("DEBUG: upload is failed: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl, fileName)
            }
        }
    }
}
