//
//  DatabaseController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/10/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation
import Firebase


@objc protocol DatabaseDelegate {
    @objc optional func notificationsDidLoad()
    @objc optional func newsDidLoad()
    @objc optional func profileDetailsDidLoad()
    @objc optional func resultsDidLoad()
}

class DatabaseController {
    var ref: DatabaseReference!
    var delegate : DatabaseDelegate?
    
    let format = "yyyy-MM-dd HH:mm:ss"

    init() {
        self.ref = Database.database().reference()
    }
    
    //setting auth details
    func setProfileDetails(_ name : String, _ address : String, _ index : String, _ image : String, _ isAdmin : Bool){
        if let user = Auth.auth().currentUser{
            self.ref.child("users").child(user.uid).setValue([
                "name" : name,
                "image": image,
                "address" : address,
                "index" : index,
                "admin" : isAdmin,
                "temperature" : Float(0),
                "survey": [
                    "answers" : [],
                    "score": 0,
                    "date": ""
                ],
                "location": []
            ])
        }
    }
    
    func signOut(){
        let auth = Auth.auth()
        do {
            try auth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out:\(signOutError)")
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
            print("id:\(0) / \(UserDefaults().nameOfUser)")
            UserDefaults().recentTemperature = value?["temperature"] as? Float ?? 0
            UserDefaults().isAdmin = value?["admin"] as? Bool ?? false
            UserDefaults().nameOfUser = value?["name"] as? String ?? ""
            UserDefaults().userImage = value?["image"] as? String ?? ""
            
            self.delegate?.profileDetailsDidLoad?()
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
    func updateSurveyResults(answers a : [Int], _ score : Int){
        guard let user = Auth.auth().currentUser else {
            return
        }
        self.ref.child("users/\(user.uid)/survey/answers").setValue(a)
        self.ref.child("users/\(user.uid)/survey/score").setValue(score)
        self.ref.child("users/\(user.uid)/survey/date").setValue("\(Date().getStringDate(by: format))")
    }
    
    func updateAdminStatus(status stat : Bool){
       guard let user = Auth.auth().currentUser else {
            return
        }
        self.ref.child("users/\(user.uid)/admin").setValue(stat)
    }
    
    func updateLocation(_ location : [Double]){
        guard let user = Auth.auth().currentUser else {
            return
        }
        self.ref.child("users/\(user.uid)/location").setValue(location)
    }
    
    func getAllResults(){
        self.ref.child("users").observeSingleEvent(of: .value) { (snapshot) in
            let data = snapshot.children.allObjects as! [DataSnapshot]
            for child in data{
                let name = child.childSnapshot(forPath: "name").value as? String ?? ""
                let score = child.childSnapshot(forPath: "survey/score").value as? Int ?? 0
                let dateStr = child.childSnapshot(forPath: "survey/date").value as? String ?? ""
                print(dateStr)
                let date = dateStr.toDate(withFormat: self.format) ?? Date()
                let result = Result(name, date, score)
                Result.addResult(result)
            }
            self.delegate?.resultsDidLoad?()
        }
    }
    
    func getAllLocations(){
        _ = self.ref.child("users").observeSingleEvent(of: .value) { (snapshot) in
            let data = snapshot.children.allObjects as! [DataSnapshot]
            for child in data{
                let userTemp = child.childSnapshot(forPath: "temperature").value as? Float ?? 35.0
                if userTemp > 37 {
                    let userLoc = child.childSnapshot(forPath: "location").value as? [Double] ?? []
                    Location.setCoordinates(coordinates: userLoc)
                }
            }
        }
    }
    
    func getNotifications(){
        Notification.clearNotifications()
        self.ref.child("notifications").observeSingleEvent(of: .value) { (snapshot) in
            let currentNotCount = Notification.getNotificationCount()
            let data = snapshot.children.allObjects as! [DataSnapshot]
            if data.count != currentNotCount{
                for child in data{
                    let message = child.childSnapshot(forPath: "message").value as! String
                    let date = child.childSnapshot(forPath: "time").value as! String
                    Notification().setNotifications(not: [date, message])
                }
            }
            self.delegate?.notificationsDidLoad?()
        }
    }
    
    func newNotification(_ message : String){
        let now = Date().getStringDate()
        let count = Notification.getNotificationCount() + 1
        self.ref.child("notifications/notification\(count)/message").setValue(message)
        self.ref.child("notifications/notification\(count)/time").setValue(now)
    }
    
    func newNewsItem(_ message : String){
        let now = Date().getStringDate()
        let count = News.getNewsCount() + 1
        self.ref.child("news/news\(count)/message").setValue(message)
        self.ref.child("news/news\(count)/time").setValue(now)
    }
    
    func getNews(){
        News.clearNews()
        self.ref.child("news").observeSingleEvent(of: .value) { (snapshot) in
            let currentNotCount = Notification.getNotificationCount()
            let data = snapshot.children.allObjects as! [DataSnapshot]
            if data.count != currentNotCount{
                for child in data{
                    let message = child.childSnapshot(forPath: "message").value as! String
                    let date = child.childSnapshot(forPath: "time").value as! String
                    News().setNews(news: [date, message])
                }
            }
            self.delegate?.newsDidLoad?()
        }
    }
}

//https://firebase.google.com/docs/database/ios/read-and-write
