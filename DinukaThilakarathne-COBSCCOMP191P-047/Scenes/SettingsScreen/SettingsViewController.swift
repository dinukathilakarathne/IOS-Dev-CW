//
//  SettingsViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/31/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

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

//        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func createAccountPressed(){
        
    }
    
    @objc func logoutPressed(){
        
    }
    
    @objc func shareAppPressed(){
        
    }
    
    @objc func ContactUsPressed(){
        
    }
    
}
