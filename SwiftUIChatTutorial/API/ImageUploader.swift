//
//  ImageUploader.swift
//  SwiftUIChatTutorial
//
//  Created by MacBook on 19.03.2023.
//

import Foundation
import Firebase
import UIKit
import FirebaseStorage

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String)-> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5)else {return}
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error{
                print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
                return
            }
            // access to the pointer where the image exists now, we do not have to handle error, it gives us the location
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}
 
