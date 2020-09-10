//
//  SettingsController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/10/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

protocol SettingsDelegate {
    func contactUsPressed()
    func sharePressed()
    func showResultsPage()
    func showSignUpPage()
    func loggedOut()
}

class SettingsController{
    
    var delegate : SettingsDelegate?
    
    func contactUsButtonPressed(){
        delegate?.contactUsPressed()
    }
    
    func shareButtonPressed(){
        delegate?.sharePressed()
    }
    
    func showResultsButtonPressed(){
        delegate?.showResultsPage()
    }
    
    //methods for login/create account
    func createAccountButtonPressed(){
        delegate?.showSignUpPage()
    }
    
    func logoutButtonPressed(){
        UserDefaults().clearDefaults()
        delegate?.loggedOut()
    }
    
    
}
