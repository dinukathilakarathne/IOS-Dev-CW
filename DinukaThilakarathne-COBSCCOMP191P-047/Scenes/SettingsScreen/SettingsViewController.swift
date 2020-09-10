//
//  SettingsViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/31/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let controller = SettingsController()

    @IBOutlet weak var profileDetailsView: profileDetails!
    
    @IBOutlet weak var contactButton: RoundedButton!{
        didSet{
            contactButton.contentView.backgroundColor = Asset.accentColor.color
            contactButton.roundButton.setTitle(L10n.contactUs, for: .normal)
            contactButton.roundButton.tintColor = Asset.backgroundColor.color
            contactButton.roundButton.addTarget(self, action: #selector(ContactUsPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var shareButton: RoundedButton!{
        didSet{
            shareButton.contentView.backgroundColor = Asset.secondaryColor.color
            shareButton.roundButton.setTitle(L10n.share, for: .normal)
            shareButton.roundButton.tintColor = Asset.backgroundColor.color
            shareButton.roundButton.addTarget(self, action: #selector(shareAppPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var settingsPrimaryButton: RoundedButton!{
        didSet{
            settingsPrimaryButton.contentView.backgroundColor = Asset.defaultRed.color
            settingsPrimaryButton.contentView.layer.cornerRadius = 5
            settingsPrimaryButton.roundButton.tintColor = .white
            
            if UserDefaults().isLoggedIn{
                settingsPrimaryButton.roundButton.setTitle(L10n.logout, for: .normal)
                settingsPrimaryButton.roundButton.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
                return
            }
            settingsPrimaryButton.roundButton.setTitle(L10n.createAccount, for: .normal)
            settingsPrimaryButton.roundButton.addTarget(self, action: #selector(createAccountPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var seeResultsButton: RightIconButton!{
        didSet{
            seeResultsButton.rightIconButton.setTitle(L10n.showResults, for: .normal)
            seeResultsButton.rightIconButton.tintColor = Asset.defautTextColor.color
            seeResultsButton.buttonIcon.tintColor = Asset.defautTextColor.color
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        controller.delegate = self
        setUI()

    }
    
    @objc func createAccountPressed(){
        controller.createAccountButtonPressed()
    }
    
    @objc func logoutPressed(){
        controller.logoutButtonPressed()
    }
    
    @objc func shareAppPressed(){
        controller.shareButtonPressed()
    }
    
    @objc func ContactUsPressed(){
        controller.contactUsButtonPressed()
    }
    
    func setUI(){
        if !UserDefaults().isLoggedIn{
            self.profileDetailsView.isHidden = true
            self.profileDetailsView.heightAnchor.constraint(equalToConstant: 0).isActive = true
            self.settingsPrimaryButton.roundButton.setTitle(L10n.createAccount, for: .normal)
        }else{
            self.profileDetailsView.isHidden = false
            self.profileDetailsView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            self.settingsPrimaryButton.roundButton.setTitle(L10n.logout, for: .normal)
        }
    }
    
}

extension SettingsViewController : SettingsDelegate{
    
    func contactUsPressed() {
        //unused
    }
    
    func sharePressed() {
        //unused
    }
    
    func showResultsPage() {
        //unused
    }
    
    func showSignUpPage() {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
    
    func loggedOut() {
        DispatchQueue.main.async {
            self.setUI()
            self.settingsPrimaryButton.roundButton.addTarget(self, action: #selector(self.createAccountPressed), for: .touchUpInside)
        }
    }
    
    
}
