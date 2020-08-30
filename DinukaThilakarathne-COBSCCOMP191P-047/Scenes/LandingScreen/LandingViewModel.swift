//
//  LandingViewModel.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

final class LandingViewModel {
    
    private var email : String? = nil
    private var password : String? = nil
    
    func loginButtonPressed(){
        print("login button pressed")
    }
    
    func setEmail(_ email : String){
        self.email = email
    }
    
    func setPassword(_ password : String){
        self.password = password
    }
    
}
