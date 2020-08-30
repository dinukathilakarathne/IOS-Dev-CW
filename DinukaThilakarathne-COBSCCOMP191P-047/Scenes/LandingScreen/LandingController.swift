//
//  LandingViewModel.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit
import Firebase

//protocols for executing
protocol LandingControllerDelegate {
    func passwordIsEmpty()
    func emailIsEmpty()
    func authError(_ e : Error)
    func isAuthenticating(_ value : Bool)
    func showHomeScreen()
}

final class LandingController {
    
    private var email : String? = nil
    private var password : String? = nil
    private var isAuthenticating : Bool = false
    
    var delegate : LandingControllerDelegate?
    
    func loginButtonPressed(){
//        var email = self.email ?? ""
//        var password = self.password ?? ""
        email = "ashandc4@gmail.com"
        password = "123456"
//        if email.isEmpty{
//            delegate?.emailIsEmpty()
//        }else if password.isEmpty {
//            delegate?.passwordIsEmpty()
//        }else {
        logUser(email!, password!)
//        }
    }
    
    //setters
    func setEmail(_ email : String){
        self.email = email
    }
    
    func setPassword(_ password : String){
        self.password = password
    }
    
    //method used for user authentication
    func logUser(_ email : String, _ password : String){
        
        isAuthenticating = true
        delegate?.isAuthenticating(true)
        let email = self.email ?? ""
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
            self?.delegate?.showHomeScreen()
        }
    }
}
