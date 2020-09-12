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
    func showNotifications()
}

class HomeController{
    
    var delegate : HomeDelegate?
    
    init() {
        DatabaseController().newNotification("sjkjkfaskkkfskdfjdjkjkfksjkfjskdjfksjkfskkfdkfjjfskfsjdkjfj")
    }
    
    func newsButtonPressed(){
        print("news")
        delegate?.showNews()
    }
    
    func notificationBellPressed(){
        print("nots")
        delegate?.showNotifications()
    }
}
