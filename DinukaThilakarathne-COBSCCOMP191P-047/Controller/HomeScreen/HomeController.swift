//
//  HomeController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/12/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

protocol HomeDelegate {
    func showNews()
}

class HomeController{
    
    var delegate : HomeDelegate?
    let db : DatabaseController?
    
    init() {
        db = DatabaseController()
        db?.getCurrentProfileDetails()
        db?.getAllResults()
    }
    
    func newsButtonPressed(){
        delegate?.showNews()
    }
    
    func getNotifications(){
        db?.getNotifications()
    }
    
}
