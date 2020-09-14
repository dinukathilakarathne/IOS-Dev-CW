//
//  StorageController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/14/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation
import Firebase

@objc protocol StorageDelegate{
    func setImage(_ url : String)
}

class StorageController {
    
    var ref : StorageReference
    var delegate : StorageDelegate?
    
    init() {
        ref = Storage.storage().reference(forURL: AppConstants.storageRefURL)
    }
    
    func getProfileImageURL(_ imgData : Data){
        if let user = Auth.auth().currentUser?.uid {
            let storageRef = ref.child("profile").child(user)
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            storageRef.putData(imgData, metadata: metadata) { (storageMetaData, error) in
                if error != nil{
                    print("Error \(String(describing: error?.localizedDescription))")
                    return
                }
                
                storageRef.downloadURL { (url, error) in
                    if let metaImageURL = url?.absoluteString{
                        self.delegate?.setImage(metaImageURL)
                    }
                }
            }
        }
    }
}
