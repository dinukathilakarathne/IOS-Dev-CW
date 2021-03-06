//
//  SignUpViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/2/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {
    
    let controller = SignUpController()
    
    
    @IBOutlet weak var profileImage: UIImageView!{
        didSet{
            profileImage.image = Asset.emptyImage.image
        }
    }
    @IBOutlet weak var selectImageButton: UIButton!{
        didSet{
            selectImageButton.setTitle("Choose image", for: .normal)
            selectImageButton.tintColor = Asset.white.color.withAlphaComponent(0.5)
            selectImageButton.titleLabel?.font = FontFamily.Abel.regular.font(size: 16)
        }
    }
    
    
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
    
    @IBOutlet weak var nameField: RoundedTextField!{
        didSet{
            nameField.roundedTextField.delegate = self
            nameField.roundedTextField.returnKeyType = .done
            nameField.roundedTextField.attributedPlaceholder = NSAttributedString(string: L10n.enterNamePlaceholder, attributes: [NSAttributedString.Key.foregroundColor : Asset.lightPlaceholderColor.color])
        }
    }
    
    @IBOutlet weak var addressField: RoundedTextField!{
        didSet{
            addressField.roundedTextField.delegate = self
            addressField.roundedTextField.returnKeyType = .done
            addressField.roundedTextField.attributedPlaceholder = NSAttributedString(string: L10n.enterAddressPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : Asset.lightPlaceholderColor.color])
        }
    }
    
    @IBOutlet weak var idField: RoundedTextField!{
        didSet{
            idField.roundedTextField.delegate = self
            idField.roundedTextField.returnKeyType = .done
            idField.roundedTextField.attributedPlaceholder = NSAttributedString(string: L10n.enterIdPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : Asset.lightPlaceholderColor.color])
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
        setUI()
    }
    
    func setUI(){
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }
    
    @objc func signUpPressed(){
        let email = emailTextField.roundedTextField.text ?? ""
        let password = passwordTextField.roundedTextField.text ?? ""
        let reenteredPassword = reenterPasswordField.roundedTextField.text ?? ""
        let name = nameField.roundedTextField.text ?? ""
        let address = addressField.roundedTextField.text ?? ""
        let id = idField.roundedTextField.text ?? ""
        
        controller.setEmail(email)
        controller.setPassword(password)
        controller.setReenteredPassword(reenteredPassword)
        controller.setAddress(address)
        controller.setName(name)
        controller.setID(id)
        controller.setProfileImage(profileImage.image)
        controller.signUpButtonPressed()
    }
    
    @objc func loginPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageButtonPressed(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
//        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
}

extension SignUpViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension SignUpViewController : SignUpControllerDelegate {
    func addressIsEmpty() {
        SingleActionAlert(
            withTitle: "The Address field is empty",
            withMessage: "Please enter an address.",
            actionName: L10n.ok,
            self
        ).present()
    }
    
    func nameIsEmpty() {
        SingleActionAlert(
            withTitle: "The Name field is empty",
            withMessage: "Please enter an name.",
            actionName: L10n.ok,
            self
        ).present()
    }
    
    func idIsEmpty() {
        SingleActionAlert(
            withTitle: "The ID field is empty",
            withMessage: "Please enter an ID.",
            actionName: L10n.ok,
            self
        ).present()
    }
    
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

extension SignUpViewController : ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        guard let profileImage = image else {
            return
        }
    
        self.profileImage.image = profileImage
    }
}

//getting and setting the profile image using protocols
//https://www.youtube.com/watch?v=0MrJFBGVuk4&list=PLaXWdRaxFtVfa3C1u56Cr6Bc4wcCVKpHp&index=18
extension SignUpViewController :  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            profileImage.image = imageSelected
            controller.setProfileImage(imageSelected)
        }
        
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            profileImage.image = imageOriginal
            controller.setProfileImage(imageOriginal)

        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
