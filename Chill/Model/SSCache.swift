//
//  SSCache.swift
//  Chill
//
//  Created by Luis Gonzalez on 7/9/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class SSCache: NSObject {

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func savePicture(image: UIImage, key: String) {
        if let data = image.jpegData(compressionQuality: 1.0) {
            let filename = getDocumentsDirectory().appendingPathComponent("\(key).jpg")
            print(filename)
            print()
            try? data.write(to: filename)
        }
    }
    
    func getImage(Key: String) -> UIImage?{
        let fileManager = FileManager.default
        let filename = getDocumentsDirectory().appendingPathComponent("\(Key).jpg")
        if fileManager.fileExists(atPath: filename.path) {
            return UIImage(contentsOfFile: filename.path)
        }
        return nil
    }
    
    func deleteImage(image: UIImage, key: String) {
        let fileManager = FileManager.default
        let filename = getDocumentsDirectory().appendingPathComponent("\(key).jpg")
        do {
        try fileManager.removeItem(at: filename)
        } catch let error as NSError {
            print(error)
        }
    }
    
}
