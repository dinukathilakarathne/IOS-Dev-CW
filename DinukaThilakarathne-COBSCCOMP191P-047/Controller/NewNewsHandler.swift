//
//  NewNotificationController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/14/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

protocol NewNewsDelegate {
    func showSuccessMessage()
}

protocol NewNewsCoordinator {
    func didAddNotification()
}

class NewNewsHandler{
        
    var db : DatabaseController!
    var notificationBody : String = ""
    var delegate : NewNewsHandler?
    var coordinator : NewNewsCoordinator?
    
    init() {
        db = DatabaseController()
    }
    
    func setNewsBody(_ body : String){
        notificationBody = body
    }
    
    func createNewsPressed(){
        addNewNotification()
        db.newNotification(notificationBody)
        delegate?.showSuccessMessage()
    }
    
    func addNewNotification(){
        let date = Date().getStringDate()
        Notification().setNotifications(not: [date, notificationBody])
        coordinator?.didAddNotification()
    }
    
    
    
}
