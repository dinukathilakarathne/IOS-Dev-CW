//
//  Notification.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/12/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation


class Notification {
    
    private static var notifications : [[String]] = []
    
    static func getNotificationCount() -> Int {
        return notifications.count
    }
    
    func setNotifications(not : [String]){
        Notification.notifications.append(not)
    }
    
    static func getNotifications() -> [[String]]{
        return notifications
    }
    
    static func clearNotifications(){
        notifications.removeAll()
    }
}
