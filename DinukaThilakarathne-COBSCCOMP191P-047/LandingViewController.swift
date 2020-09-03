//
//  ViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit
import Firebase

class LandingViewController: UIViewController {
    
    //instantiating controller
    let controller = LandingController()
    
    //linking and setting UI components
    @IBOutlet weak var contentView: UIView!{
        didSet{
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.contentView.bounds
            gradientLayer.colors = [UIColor.clear, Asset.accentGreen.color.cgColor]
            contentView.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    @IBOutlet weak var landingPageHeadingOutline: UILabel!{
        didSet{
            landingPageHeadingOutline.text = L10n.headingOutline
            landingPageHeadingOutline.font = FontFamily.Abel.regular.font(size: 20)
            landingPageHeadingOutline.textColor = Asset.white.color
        }
    }
    @IBOutlet weak var landingPageTitle: UILabel!{
        didSet{
            landingPageTitle.text = L10n.appName
            landingPageTitle.font = FontFamily.BebasNeue.regular.font(size: 60)
            landingPageTitle.textColor = Asset.white.color
        }
    }
    
    @IBOutlet weak var emailTextField: RoundedTextField!{
        didSet{
            emailTextField.roundedTextField.delegate = self
            emailTextField.roundedTextField.returnKeyType = .done
            emailTextField.roundedTextField.keyboardType = .emailAddress
            emailTextField.roundedTextField.attributedPlaceholder = NSAttributedString(string: L10n.enterEmailPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : Asset.lightPlaceholderColor.color])
        }
    }
    
    @IBOutlet weak var passwordTextField: RoundedTextField!{
        didSet{
            passwordTextField.roundedTextField.delegate = self
            passwordTextField.roundedTextField.returnKeyType = .done
            passwordTextField.roundedTextField.isSecureTextEntry = true
            passwordTextField.roundedTextField.attributedPlaceholder = NSAttributedString(string: L10n.enterPasswordPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : Asset.lightPlaceholderColor.color])
        }
    }
    
    @IBOutlet weak var loginButton: RoundedButton!{
        didSet{
            //adding Objective-C selectors
            loginButton.roundButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
            
            loginButton.roundButton.titleLabel?.addCharacterSpacing(value: 5)
            loginButton.roundButton.setTitle(L10n.login, for: .normal)
        }
    }
    @IBOutlet weak var makeAccountButton: UIButton!{
        didSet{
            makeAccountButton.setTitle("Don't have an account? Sign up", for: .normal)
            makeAccountButton.tintColor = Asset.white.color.withAlphaComponent(0.5)
            makeAccountButton.titleLabel?.font = FontFamily.Abel.regular.font(size: 16)
            makeAccountButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting controller delegate for passing data
        controller.delegate = self
    }
    
    @objc func loginPressed(){
        let email = emailTextField.roundedTextField.text ?? ""
        let password = passwordTextField.roundedTextField.text ?? ""
        
        //passing data
        controller.setEmail(email)
        controller.setPassword(password)
        controller.loginButtonPressed()
    }
    
    @objc func signUpPressed(){
        controller.signUpPressed()
    }
}


extension LandingViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LandingViewController : LandingControllerDelegate {
    
    func showSignUpScreen() {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
    
    
    //controller delegate methods
    func showHomeScreen() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DashboardTabController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    
    func isAuthenticating(_ value: Bool) {
        //unused
    }
    
    func passwordIsEmpty() {
        SingleActionAlert(
            withTitle: "Empty Password field",
            withMessage: "Please enter a password",
            actionName: L10n.ok,
            self
        ).present()
    }
    
    func emailIsEmpty() {
        SingleActionAlert(
            withTitle: "Empty Email field",
            withMessage: "Please enter an email",
            actionName: L10n.ok,
            self
        ).present()
    }
    
    func authError(_ e: Error) {
        SingleActionAlert(
            withTitle: "Authentication error",
            withMessage: e.localizedDescription,
            actionName: L10n.ok,
            self
        ).present()
    }
}



//https://medium.com/@KaushElsewhere/how-to-dismiss-keyboard-in-a-view-controller-of-ios-3b1bfe973ad1

