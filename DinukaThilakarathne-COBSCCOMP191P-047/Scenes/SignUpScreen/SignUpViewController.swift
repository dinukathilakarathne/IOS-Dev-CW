//
//  SignUpViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/2/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let controller = SignUpController()
    
    @IBOutlet var contentView: UIView!{
        didSet{
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.contentView.bounds
            gradientLayer.colors = [UIColor.clear, Asset.primaryColor.color.cgColor]
            contentView.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.text = L10n.signUpPageTitle
            titleLabel.font = FontFamily.BebasNeue.regular.font(size: 60)
            titleLabel.textColor = Asset.white.color
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
    @IBOutlet weak var reenterPasswordField: RoundedTextField!{
        didSet{
            reenterPasswordField.roundedTextField.delegate = self
            reenterPasswordField.roundedTextField.returnKeyType = .done
            reenterPasswordField.roundedTextField.isSecureTextEntry = true
            reenterPasswordField.roundedTextField.attributedPlaceholder = NSAttributedString(string: L10n.reenterPasswordPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : Asset.lightPlaceholderColor.color])
            
        }
    }
    @IBOutlet weak var signUpButton: RoundedButton!{
        didSet{
            signUpButton.roundButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
            signUpButton.roundButton.titleLabel?.addCharacterSpacing(value: 5)
            signUpButton.roundButton.setTitle(L10n.signUp, for: .normal)
        }
    }
    @IBOutlet weak var loginButton: UIButton!{
        didSet{
            loginButton.setTitle("If you have an account. Login", for: .normal)
            loginButton.tintColor = Asset.white.color.withAlphaComponent(0.5)
            loginButton.titleLabel?.font = FontFamily.Abel.regular.font(size: 16)
            loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
    }
    
    @objc func signUpPressed(){
        let email = emailTextField.roundedTextField.text ?? ""
        let password = passwordTextField.roundedTextField.text ?? ""
        let reenteredPassword = reenterPasswordField.roundedTextField.text ?? ""
        
        controller.setEmail(email)
        controller.setPassword(password)
        controller.setReenteredPassword(reenteredPassword)
        controller.signUpButtonPressed()
    }
    
    @objc func loginPressed(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension SignUpViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension SignUpViewController : SignUpControllerDelegate {
    func unidenticalPassword() {
        SingleActionAlert(
            withTitle: "The passwords do not match",
            withMessage: "Please re-enter the passwords",
            actionName: L10n.ok,
            self
        ).present()
    }
    
    func showHomeScreen() {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DashboardTabController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func passwordIsEmpty() {
        SingleActionAlert(
            withTitle: "Empty Password field",
            withMessage: "Please enter a password",
            actionName: L10n.ok,
            self
        ).present()
    }
    
    func reenterPasswordIsEmpty() {
        SingleActionAlert(
            withTitle: "Empty Re-entered Password field",
            withMessage: "Please re-enter the password",
            actionName: L10n.ok,
            self
        ).present()
    }
    
    func emailIsEmpty() {
        SingleActionAlert(
            withTitle: "Empty email field",
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
    
    func isAuthenticating(_ value: Bool) {
        //unused
    }
    
    
}
