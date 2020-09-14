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
    func createNotificationPressed()
}

class NotificationController{
    
    var db : DatabaseController?
    var delegate : NotificationDelegate?
    
    init() {
        db = DatabaseController()
        db?.delegate = self
    }
    
    func getNotifications(){
        db?.getNotifications()
    }
    
//    func notificationsLoaded(){
//        delegate?.updateTableView()
//    }
    
    func createNotificationPressed(){
        delegate?.createNotificationPressed()
    }
    
}

extension NotificationController : DatabaseDelegate{
    func notificationsDidLoad() {
        delegate?.updateTableView()
    }
}
