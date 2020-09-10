//
//  DatabaseController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/10/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation
import Firebase


class DatabaseController {
    var ref: DatabaseReference!

    init() {
        self.ref = Database.database().reference()
    }
    
    //setting auth details
    func setProfileDetails(_ address : String, _ index : String){
        if let user = Auth.auth().currentUser{
            self.ref.child("users").child(user.uid).setValue([
                "address" : address,
                "index" : index
            ])
        }
    }
    
    //getting profile details
    func getCurrentProfileDetails(){
        guard let uuid = Auth.auth().currentUser?.uid else{
            return
        }
        
        self.ref.child("users").child(uuid).child("address").observeSingleEvent(of: .value , with: { (snapshot) in
                UserDefaults().userAddress = snapshot.value as! String
        })
        
        self.ref.child("users").child(uuid).child("index").observeSingleEvent(of: .value , with: { (snapshot) in
                UserDefaults().userID = snapshot.value as! String
        })
        
        self.ref.child("users").child(uuid).child("address").observeSingleEvent(of: .value , with: { (snapshot) in
            if snapshot.value as! String == "1" {
                UserDefaults().isAdmin = true
            }
        })
    }
}

//https://firebase.google.com/docs/database/ios/read-and-write
