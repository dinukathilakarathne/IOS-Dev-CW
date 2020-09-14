//
//  NewNotificationViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/13/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class NewNotificationViewController: UIViewController {
    
    var controller = NewNotificationController()
    
    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = L10n.newNotificationsTitle
        }
    }
    
    @IBOutlet weak var newNotificationField: UITextView!{
        didSet{
            newNotificationField.delegate = self
            newNotificationField.layer.borderWidth = 3
            newNotificationField.layer.borderColor = Asset.primaryColor.color.cgColor
            newNotificationField.layer.cornerRadius = AppConstants.viewCornerRadius
        }
    }
    
    @IBOutlet weak var passNotificationButtton: RoundedButton!{
        didSet{
            passNotificationButtton.roundButton.setTitle(L10n.newNotification, for: .normal)
            passNotificationButtton.contentView.backgroundColor = Asset.accentColor.color
            passNotificationButtton.roundButton.tintColor = Asset.backgroundColor.color
            passNotificationButtton.roundButton.addTarget(self, action: #selector(passNotificationPressed), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
    }
    
    @objc func passNotificationPressed(){
        controller.setNotificationBody(newNotificationField.text)
        controller.createNotificationPressed()
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

extension NewNotificationViewController : UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
         if(text == "\n") {
             textView.resignFirstResponder()
             return false
         }
         return true
        
    }
}

extension NewNotificationViewController : NewNotificationDelegate{
    
    func showSuccessMessage() {
        SingleActionAlert(withTitle: "Success", withMessage: "Successfully created the new notification", actionName: L10n.ok, self, true).present()
    }
    
}

