//
//  SignUpController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/2/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit
import Firebase

protocol SignUpControllerDelegate {
    func showHomeScreen()
    func passwordIsEmpty()
    func addressIsEmpty()
    func nameIsEmpty()
    func idIsEmpty()
    func reenterPasswordIsEmpty()
    func emailIsEmpty()
    func authError(_ e : Error)
    func isAuthenticating(_ value : Bool)
    func unidenticalPassword()
}

final class SignUpController {
    
    private var email : String? = nil
    private var password : String? = nil
    private var reenteredPassword : String? = nil
    private var name : String? = nil
    private var address : String? = nil
    private var id : String? = nil
    private var isAuthenticating : Bool = false
    private var profileImage : UIImage?
    
    var delegate : SignUpControllerDelegate?
    
    func signUpButtonPressed(){
        let email = self.email ?? ""
        let password = self.password ?? ""
        let reenteredPassword = self.reenteredPassword ?? ""
        let name = self.name ?? ""
        let address = self.address ?? ""
        let id = self.id ?? ""


        if email.isEmpty {
            delegate?.emailIsEmpty()
        }else if password.isEmpty{
            delegate?.passwordIsEmpty()
        }else if reenteredPassword.isEmpty{
            delegate?.reenterPasswordIsEmpty()
        }else if password != reenteredPassword{
            delegate?.unidenticalPassword()
        }else if name.isEmpty {
            delegate?.nameIsEmpty()
        }else if address.isEmpty {
            delegate?.addressIsEmpty()
        }else if id.isEmpty{
            delegate?.idIsEmpty()
        }else{
            createUser(email, password)
        }
    }
    
    func setEmail(_ email : String){
        self.email = email
    }
    
    func setPassword(_ password : String){
        self.password = password
    }
    
    func setReenteredPassword(_ reenteredPassword : String){
        self.reenteredPassword = reenteredPassword
    }
    
    func setName(_ name : String){
        self.name = name
    }
    
    func setAddress(_ address : String){
        self.address = address
    }
    
    func setProfileImage(_ image : UIImage?){
        self.profileImage = image
    }
    
    private func createUser(_ email : String, _ password : String){
        
        isAuthenticating = true
        delegate?.isAuthenticating(true)
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let e = error{
                self.delegate?.authError(e)
                self.delegate?.isAuthenticating(false)
                return
            }
            self.delegate?.showHomeScreen()
        }
    }
    
}
