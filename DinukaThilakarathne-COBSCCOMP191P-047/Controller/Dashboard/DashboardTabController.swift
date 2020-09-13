//
//  HomeViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit
import Firebase

class DashboardTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        let u = UserDefaults()
        print("from Dash {log:\(u.isLoggedIn),\(Auth.auth().currentUser?.displayName)}")
    }
}

extension DashboardTabController : UITabBarControllerDelegate {

}
