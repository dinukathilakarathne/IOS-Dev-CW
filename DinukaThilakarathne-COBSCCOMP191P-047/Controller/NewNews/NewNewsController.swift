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

class NewNewsController{
        
    var db : DatabaseController!
    var newsBody : String = ""
    var delegate : NewNewsDelegate?
    var coordinator : NewNewsCoordinator?
    
    init() {
        db = DatabaseController()
    }
    
    func setNewsBody(_ body : String){
        newsBody = body
    }
    
    func createNewsPressed(){
        addNewNotification()
        db.newNewsItem(newsBody)
        delegate?.showSuccessMessage()
    }
    
    func addNewNotification(){
        let date = Date().getStringDate()
        Notification().setNotifications(not: [date, newsBody])
        coordinator?.didAddNotification()
    }
    
    
    
}
