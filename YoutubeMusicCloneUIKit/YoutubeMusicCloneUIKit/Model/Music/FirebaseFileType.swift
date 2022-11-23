//
//  FirebaseFileType.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 20.11.2022.
//

import Foundation

enum FirebaseFileType: String, CaseIterable, Identifiable {
    case profile
    case musicImage
    case musicAudio
    case musicVideo
    
    var id : String { return rawValue}
    
    var compressValue: Double {
        switch self {
        case .profile: return 0.7
        case .musicImage, .musicAudio, .musicVideo: return 0.14
        }
    }
    
    var folderName: String
    {
        switch self {
        case .profile: return "/user/profile_images/"
        case .musicImage: return "/music/images/"
        case .musicAudio: return "/music/audio/"
        case .musicVideo: return "/music/video/"
        }
    }
    
    private var filePreName: String
    {
        switch self {
        case .profile: return "pi_"
        case .musicImage: return "mi_"
        case .musicAudio: return "ma_"
        case .musicVideo: return "mv_"
        }
    }
    
    func createFileName() -> String {
        return "\(filePreName)\(NSUUID().uuidString)"
    }
    
    func getFolderPath(fileName: String) -> String {
        return "\(folderName)\(fileName)"
    }
}
