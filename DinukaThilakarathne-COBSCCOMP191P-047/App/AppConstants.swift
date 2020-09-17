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

//appconstants
class AppConstants {
    static let viewCornerRadius : CGFloat  = 5
    static let maxTemperature : Float = 37.5
    static let storageRefURL : String = "gs://nibm-covid19-680ec.appspot.com"
}

//saving user defaults
class UserDefaults : SwiftDefaults{
    @objc dynamic var isLoggedIn : Bool = false
    @objc dynamic var nameOfUser : String = ""
    @objc dynamic var userAddress : String = ""
    @objc dynamic var userIndex : String = ""
    @objc dynamic var userImage : String = ""
    @objc dynamic var userID : String = ""
    @objc dynamic var isAdmin : Bool = false
    @objc dynamic var recentTemperature : Float = 0
    
    //method for setting defaults on log-in
    func setDefaults(){
        let db = DatabaseController()
        let user = Auth.auth().currentUser
        UserDefaults().isLoggedIn = true
        UserDefaults().nameOfUser = user?.displayName ?? ""
        UserDefaults().userImage = user?.photoURL?.absoluteString ?? ""
        
        db.getCurrentProfileDetails()
    }
    
    //method for clearing defaults on log-off
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

