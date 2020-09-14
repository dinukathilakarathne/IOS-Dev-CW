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
    var timer : Timer?
    
    @IBOutlet weak var profileDetailHeight: NSLayoutConstraint!
    @IBOutlet weak var profileDetailsView: profileDetails!
    
    @IBOutlet weak var showSurveyResults: RightIconButton!{
        didSet{
            showSurveyResults.rightIconButton.addTarget(self, action: #selector(ContactUsPressed), for: .touchUpInside)
        }
    }

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
            }else{
                settingsPrimaryButton.roundButton.setTitle(L10n.login, for: .normal)
                settingsPrimaryButton.roundButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
            }
            
        }
    }
    
    @IBOutlet weak var seeResultsButton: RightIconButton!{
        didSet{
            seeResultsButton.rightIconButton.setTitle(L10n.showResults, for: .normal)
            seeResultsButton.rightIconButton.tintColor = Asset.defautTextColor.color
            seeResultsButton.buttonIcon.tintColor = Asset.defautTextColor.color
        }
    }
    
    @IBOutlet weak var createAccountButton: UIButton!{
        didSet{
            createAccountButton.addTarget(self, action: #selector(createAccountPressed), for: .touchUpInside)
            createAccountButton.titleLabel?.font = FontFamily.Abel.regular.font(size: 16)
            createAccountButton.tintColor = Asset.defaultRed.color
            createAccountButton.setTitle(L10n.createAccount, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        controller.delegate = self
        setUI()
    }
    
    func setProfileDetails(){
        let view = profileDetailsView
        view?.addressLabel.text = UserDefaults().userAddress
        view?.nameLabel.text = UserDefaults().nameOfUser
        view?.indexLabel.text = UserDefaults().userID
        view?.profileImage.downloaded(from: UserDefaults().userImage)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUI()
    }
    
    @objc func loginPressed(){
        controller.loginButtonPressed()
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
    
    @objc func showResultPressed(){
        controller.showResultsButtonPressed()
    }
    
    func setUI(){
        setProfileDetails()
        if !UserDefaults().isLoggedIn{
            self.profileDetailsView.isHidden = true
            self.profileDetailHeight.constant = 0
            self.settingsPrimaryButton.roundButton.setTitle(L10n.login, for: .normal)
            self.createAccountButton.isHidden = false
        }else{
            self.profileDetailsView.isHidden = false
            self.settingsPrimaryButton.roundButton.setTitle(L10n.logout, for: .normal)
            self.profileDetailHeight.constant = 230
            self.createAccountButton.isHidden = true
            
        }
    }
    
}

extension SettingsViewController : SettingsDelegate, LoginCoordinator{
    
    func showProfileDetails() {
        setUI()
    }
    
    
    func loggedIn() {
        setUI()
        if UserDefaults().isLoggedIn{
            self.settingsPrimaryButton.roundButton.removeTarget(self, action: nil, for: .allEvents)
            self.settingsPrimaryButton.roundButton.addTarget(self, action: #selector(self.logoutPressed), for: .touchUpInside)
        }
    }
    
    
    func logingIn() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LandingViewController") as! LandingViewController
        vc.controller = LandingController()
        vc.controller?.coordinator = self
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
    
    
    func contactUsPressed() {
        let storyboard = UIStoryboard(name: "ContactUs", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ContactUsViewController")
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
    
    func sharePressed() {
        let storyboard = UIStoryboard(name: "Share", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ShareViewController")
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
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
        self.setUI()
        self.settingsPrimaryButton.roundButton.addTarget(self, action: #selector(self.loginPressed), for: .touchUpInside)
        self.createAccountButton.addTarget(self, action: #selector(self.createAccountPressed), for: .touchUpInside)
        
    }
    
    
}
