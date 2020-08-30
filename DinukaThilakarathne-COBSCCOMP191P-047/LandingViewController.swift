//
//  ViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    let viewModel = LandingViewModel()
    
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
            loginButton.roundButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
            
            loginButton.roundButton.titleLabel?.addCharacterSpacing(value: 5)
            loginButton.roundButton.setTitle(L10n.login, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func loginPressed(){
        
        guard let email = emailTextField.roundedTextField.text else {
            //unused
            print("email empty")
            return
        }
        guard let password = passwordTextField.roundedTextField.text else {
            //unused
            print("password empty")
            return
        }
        viewModel.setEmail(email)
        viewModel.setPassword(password)
        viewModel.loginButtonPressed()
    }
    
    
}


extension LandingViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


//https://medium.com/@KaushElsewhere/how-to-dismiss-keyboard-in-a-view-controller-of-ios-3b1bfe973ad1

