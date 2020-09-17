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

class SignUpController {
    
    private var email : String? = nil
    private var password : String? = nil
    private var reenteredPassword : String? = nil
    private var name : String? = nil
    private var address : String? = nil
    private var id : String? = nil
    private var isAdmin : Bool = false
    private var isAuthenticating : Bool = false
    private var profileImage : UIImage?
    private var profileImageURL : String!
    
    var delegate : SignUpControllerDelegate?
    let db = DatabaseController()
    let storage = StorageController()
    
    init() {
        storage.delegate = self
    }
    
    func signUpButtonPressed() -> Bool{
        let email = self.email ?? ""
        let password = self.password ?? ""
        let reenteredPassword = self.reenteredPassword ?? ""
        let name = self.name ?? ""
        let address = self.address ?? ""
        let id = self.id ?? ""
        
        if email.isEmpty {
            delegate?.emailIsEmpty()
            return false
        }else if password.isEmpty{
            delegate?.passwordIsEmpty()
            return false
        }else if reenteredPassword.isEmpty{
            delegate?.reenterPasswordIsEmpty()
            return false
        }else if password != reenteredPassword{
            delegate?.unidenticalPassword()
            return false
        }else if name.isEmpty {
            delegate?.nameIsEmpty()
            return false
        }else if address.isEmpty {
            delegate?.addressIsEmpty()
            return false
        }else if id.isEmpty{
            delegate?.idIsEmpty()
            return false
        }else{
            checkAdminStatus()
            createUser(email, password)
            return true
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
    
    func checkAdminStatus(){
        if let firstIndex = id?[0] {
            if firstIndex.lowercased() == "a"{
                self.isAdmin = true
            }
        }
    }
    
    func setName(_ name : String){
        self.name = name
    }
    
    func setAddress(_ address : String){
        self.address = address
    }
    
    func setID(_ id : String){
        self.id = id
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
            print("made profile")
            self.saveProfileData()
            self.logUser(email, password)
        }
        print("ela")
    }
    
    //method used for user authentication
    func logUser(_ email : String, _ password : String){
        isAuthenticating = true
        delegate?.isAuthenticating(true)
        let email = self.email ?? ""
        //logging in user with email and password
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            self?.isAuthenticating = false
            self?.delegate?.isAuthenticating(false)
            guard let _ = self else {
                return
            }
            if let e = error {
                self?.delegate?.authError(e)
                return
            }
            UserDefaults().setDefaults()
            self?.delegate?.showHomeScreen()
        }
    }
    
    func saveProfileData(){
        guard let imageSelected = self.profileImage else{
            print("image is null")
            return
        }
        
        guard let imageData = imageSelected.jpegData(compressionQuality:  0.4) else {
            return
        }
        storage.getProfileImageURL(imageData)
    }
}

extension SignUpController : StorageDelegate {
    func setImage(_ url: String) {
        let name = self.name ?? ""
        let address = self.address ?? ""
        let id = self.id ?? ""
        db.setProfileDetails(name, address, id, url, self.isAdmin)
    }
}
