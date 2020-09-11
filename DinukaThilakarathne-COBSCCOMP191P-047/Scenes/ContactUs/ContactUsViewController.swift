//
//  ContactUsViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/11/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {
    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = L10n.contactUs
        }
    }
    
    @IBOutlet weak var email: ContactDetails!{
        didSet{
            email.contactLabel.text = L10n.email
            email.contactButton.addTarget(self, action: #selector(sendEmail), for: .touchUpInside)
            email.contactButton.setImage(Asset.email.image, for: .normal)
            email.contactButton.tintColor = Asset.accentGreen.color
        }
    }
    
    @IBOutlet weak var phone: ContactDetails!{
        didSet{
            phone.contactLabel.text = L10n.phone
            phone.contactButton.addTarget(self, action: #selector(callPhone), for: .touchUpInside)
            phone.contactButton.setImage(Asset.smartphone.image, for: .normal)
            phone.contactButton.tintColor = Asset.accentGreen.color
        }
    }
    
    @IBOutlet weak var landLine: ContactDetails!{
        didSet{
            landLine.contactLabel.text = L10n.landPhone
            landLine.contactButton.addTarget(self, action: #selector(callLandLine), for: .touchUpInside)
            landLine.contactButton.setImage(Asset.landphone.image, for: .normal)
            landLine.contactButton.tintColor = Asset.accentGreen.color
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //methods for emailing/calling
    //sending email/calling will only work on physical device
    @objc func sendEmail(){
        let appURL = URL(string: L10n.emailAddress)!

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(appURL)
        }
    }
    
    @objc func callPhone(){
        callNumber(phoneNumber: L10n.phoneNumber)
    }
    
    @objc func callLandLine(){
        callNumber(phoneNumber: L10n.landNumber)
    }
    
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

extension ContactUsViewController : NavigationBarDelegate{
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showNotifications() {
        //unues
    }
    
    
}
