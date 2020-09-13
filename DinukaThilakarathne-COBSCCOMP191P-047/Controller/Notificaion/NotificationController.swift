//
//  NotificationController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/12/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

protocol  NotificationDelegate {
    func updateTableView()
}

class NotificationController{
    
    var db : DatabaseController?
    var delegate : NotificationDelegate?
    
    init() {
        db = DatabaseController()
    }
    
    func getNotifications(){
        db?.getNotifications()
    }
    
    func notificationsLoaded(){
        delegate?.updateTableView()
    }
    
}
