//
//  HomeViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class DashboardTabController: UITabBarController {
    
    var selectedTab: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension DashboardTabController : UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(tabBarController.selectedIndex)
        if tabBarController.selectedIndex == 1 {
            let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DashboardTabController")
            vc.modalPresentationStyle = .formSheet
            self.present(vc, animated: true, completion: nil)
        }
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if tabBarController.selectedIndex == 1{
            return false
        }
        return true
    }
}
