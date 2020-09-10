//
//  AppConstants.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/5/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit
import SwiftDefaults
import Firebase

class AppConstants {
    static let viewCornerRadius : CGFloat  = 5
}

class UserDefaults : SwiftDefaults{
    @objc dynamic var isLoggedIn : Bool = false
    @objc dynamic var nameOfUser : String = ""
    @objc dynamic var userAddress : String = ""
    @objc dynamic var userIndex : String = ""
    @objc dynamic var userImage : String = ""
    @objc dynamic var userID : String = ""
    @objc dynamic var isAdmin : Bool = false
    
    func setDefaults(){
        let db = DatabaseController()
        let user = Auth.auth().currentUser
        UserDefaults().isLoggedIn = true
        UserDefaults().nameOfUser = user?.displayName ?? ""
        UserDefaults().userImage = user?.photoURL?.absoluteString ?? ""
        
        db.getCurrentProfileDetails()
    }
    
    func clearDefaults(){
        UserDefaults().isLoggedIn = false
        UserDefaults().nameOfUser = ""
        UserDefaults().userAddress = ""
        UserDefaults().userIndex = ""
        UserDefaults().userImage = ""
        UserDefaults().userID = ""
        UserDefaults().isAdmin = false
    }
}

