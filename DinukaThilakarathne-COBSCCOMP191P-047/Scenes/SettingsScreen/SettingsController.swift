//
//  SettingsController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/10/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

protocol SettingsDelegate {
    func primaryButtonPressed()
    func contactUsPressed()
    func sharePressed()
    func showResultsPage()
    func showSignUpPage()
    func showLandingPage()
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
    
    //method for login/create account
    func primaryButtonPressed(){
        if UserDefaults().isLoggedIn{
            UserDefaults().clearDefaults()
            delegate?.showLandingPage()
            return
        }
        delegate?.showSignUpPage()
    }
    
    
}
