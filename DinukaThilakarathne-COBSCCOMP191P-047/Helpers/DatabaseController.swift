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
    
    func setProfileDetails(_ address : String, _ index : String){
        if let user = Auth.auth().currentUser{
            self.ref.child("users").child(user.uid).setValue([
                "address" : address,
                "index" : index
            ])
        }
    }
}
