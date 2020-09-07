//
//  AppConstants.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/5/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit
import SwiftDefaults

class AppConstants {
    static let viewCornerRadius : CGFloat  = 5
}

class UserDefaults : SwiftDefaults{
    dynamic var isLoggedIn : Bool = false
    dynamic var nameOfUser : String = ""
    dynamic var userAddress : String = ""
    dynamic var userIndex : String = ""
    dynamic var userImage : String = ""
}

