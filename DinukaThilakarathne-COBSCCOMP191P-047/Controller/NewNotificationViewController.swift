//
//  NewNotificationViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/13/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class NewNotificationViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = L10n.newNotificationsTitle
        }
    }
    
    @IBOutlet weak var newNotificationField: RoundedTextField!
    
    @IBOutlet weak var passNotificationButtton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension NewNotificationViewController : NavigationBarDelegate{
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showNotifications() {
        //unused
    }
    
    
}
