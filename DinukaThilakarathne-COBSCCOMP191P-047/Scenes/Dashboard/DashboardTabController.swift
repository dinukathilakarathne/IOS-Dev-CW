//
//  HomeViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class DashboardTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension DashboardTabController : UITabBarControllerDelegate {
//
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print(tabBarController.selectedIndex)
//        if tabBarController.selectedIndex == 1 {
//            let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
//            vc.modalPresentationStyle = .formSheet
//            self.present(vc, animated: true)
//        }
//    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print(viewController.self)
        if viewController is SignUpViewController{
            let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
            vc.modalPresentationStyle = .formSheet
            self.present(vc, animated: true)
            print(false)
            return false
            
        }
        print(true)
        return true
    }
}
