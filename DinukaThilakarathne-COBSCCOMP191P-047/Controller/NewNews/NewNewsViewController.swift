//
//  NewNotificationViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/13/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class NewNewsViewController : UIViewController {
    
    var controller : NewNewsController!
    
    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = L10n.newNotificationsTitle
        }
    }
    
    @IBOutlet weak var newNewsField: UITextView!{
        didSet{
            newNewsField.delegate = self
            newNewsField.layer.borderWidth = 3
            newNewsField.layer.borderColor = Asset.primaryColor.color.cgColor
            newNewsField.layer.cornerRadius = AppConstants.viewCornerRadius
        }
    }
    
    @IBOutlet weak var passNewsButtton: RoundedButton!{
        didSet{
            passNewsButtton.roundButton.setTitle(L10n.newNotification, for: .normal)
            passNewsButtton.contentView.backgroundColor = Asset.accentColor.color
            passNewsButtton.roundButton.tintColor = Asset.backgroundColor.color
            passNewsButtton.roundButton.addTarget(self, action: #selector(passNewsPressed), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
    }
    
    @objc func passNewsPressed(){
        controller.setNewsBody(newNewsField.text)
        controller.createNewsPressed()
    }
}

extension NewNewsViewController : NavigationBarDelegate{
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showNotifications() {
        //unused
    }
    
    
}

extension NewNewsViewController : UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
         if(text == "\n") {
             textView.resignFirstResponder()
             return false
         }
         return true
        
    }
}

extension NewNewsViewController : NewNewsDelegate{
    
    func showSuccessMessage() {
        SingleActionAlert(withTitle: "Success", withMessage: "Successfully created the new notification", actionName: L10n.ok, self, true).present()
    }
    
}

