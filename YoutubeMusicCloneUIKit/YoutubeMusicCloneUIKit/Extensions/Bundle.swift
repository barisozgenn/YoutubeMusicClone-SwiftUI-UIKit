//
//  Bundle.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 22.11.2022.
//

import UIKit
//import Combine

extension Bundle {
    func readFromLocalFile(fileName: String) -> Any?
        {
            var dataResult: Any?
            if let fileUrl = self.url(forResource: fileName, withExtension: nil) {
                do {
                    let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                    dataResult = try? JSONSerialization.jsonObject(with: data)
                } catch {
                    print("DEBUG: Failed to map \(error.localizedDescription)")
                }
            }else {
                print("DEBUG: Failed to load \(fileName) from bundle.")
            }
            return dataResult
        }
    /*func readFromLocalFileWithCombine(file: String) -> AnyPublisher<Data, Error> {
        self.url(forResource: file, withExtension: nil)
            .publisher
            .tryMap{ stringData in
                guard let data = try? Data(contentsOf: stringData) else {
                    print("DEBUG: Failed to load \(file) from bundle.")
                    return
                }
                return data
            }
            .mapError { error in
                return error
            }.eraseToAnyPublisher()
    }
    
    func downloadData<T: Decodable>(fileName: String) -> AnyPublisher<T, Error> {
        readFromLocalFile(file: fileName)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                print("DEBUG: Failed to map \(error.localizedDescription)")
                return
            }
            .eraseToAnyPublisher()
        
    }*/
}
