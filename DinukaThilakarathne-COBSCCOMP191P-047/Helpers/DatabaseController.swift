//
//  DatabaseController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/10/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation
import Firebase


class DatabaseController {
    var ref: DatabaseReference!

    init() {
        self.ref = Database.database().reference()
    }
    
    //setting auth details
    func setProfileDetails(_ address : String, _ index : String){
        if let user = Auth.auth().currentUser{
            self.ref.child("users").child(user.uid).setValue([
                "address" : address,
                "index" : index,
                "temperature" : Float(0),
                "survey": []
            ])
        }
    }
    
    //getting profile details
    func getCurrentProfileDetails(){
        guard let uuid = Auth.auth().currentUser?.uid else{
            return
        }
        
        self.ref.child("users").child(uuid).observeSingleEvent(of: .value , with: { (snapshot) in
            let value = snapshot.value as? NSDictionary

            UserDefaults().userAddress = value?["address"] as? String ?? ""
            UserDefaults().userID = value?["index"] as? String ?? ""
            UserDefaults().recentTemperature = value?["temperature"] as? Float ?? 0
            UserDefaults().isAdmin = value?["isAdmin"] as? Bool ?? false

        })
    }
    
    //method to update users temperature
    func updateTemperature(_ temperature : Float){
        guard let user = Auth.auth().currentUser else {
            return
        }
        self.ref.child("users/\(user.uid)/temperature").setValue(temperature)
    }
    
    //method to update users temperature
    func updateSurveyResults(answers a : [Int]){
        guard let user = Auth.auth().currentUser else {
            return
        }
        self.ref.child("users/\(user.uid)/survey").setValue(a)
    }
    
    func updateAdminStatus(status stat : Bool){
       guard let user = Auth.auth().currentUser else {
            return
        }
        self.ref.child("users/\(user.uid)/admin").setValue(stat)
    }
    
    func getNotifications(){
        self.ref.child("notifications").observeSingleEvent(of: .value) { (snapshot) in
            let currentNotCount = Notification.getNotificationCount()
            let data = snapshot.children.allObjects as! [DataSnapshot]
            if data.count != currentNotCount{
                for child in data{
                    let message = child.childSnapshot(forPath: "message").value as! String
                    let date = child.childSnapshot(forPath: "time").value as! String
                    Notification.setNotifications(not: [date, message])
                }
            }
        }
    }
    
    func newNotification(_ message : String){
        let now = Date().getStringDate()
        let count = Notification.getNotificationCount() + 1
        self.ref.child("notifications/notification\(count)/message").setValue(message)
        self.ref.child("notifications/notification\(count)/time").setValue(now)
        
    }
}

//https://firebase.google.com/docs/database/ios/read-and-write
