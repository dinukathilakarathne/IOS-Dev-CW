//
//  NewNotificationController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/14/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

protocol NewNotificationDelegate {
    func showSuccessMessage()
}

class NewNotificationController{
        
    var db : DatabaseController!
    var notificationBody : String = ""
    var delegate : NewNotificationDelegate?
    
    init() {
        db = DatabaseController()
    }
    
    func setNotificationBody(_ body : String){
        notificationBody = body
    }
    
    func createNotificationPressed(){
        addNewNotification()
        db.newNotification(notificationBody)
        delegate?.showSuccessMessage()
    }
    
    func addNewNotification(){
        let date = Date().getStringDate()
        Notification.setNotifications(not: [date, notificationBody])
    }
    
    
    
}
