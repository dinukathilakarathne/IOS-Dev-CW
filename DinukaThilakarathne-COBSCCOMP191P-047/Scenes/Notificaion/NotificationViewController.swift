//
//  NotificationViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/12/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = L10n.contactUs
        }
    }
    @IBOutlet weak var notificationTable: UITableView!{
        didSet{
            notificationTable.delegate = self
            notificationTable.dataSource = self
        }
    }
    
    var timer : Timer?
    var controller = NotificationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
        getNotifications()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.getNotifications()
        })
    }
    
    func getNotifications(){
        controller.getNotifications()
        controller.notificationsLoaded()
    }

}

extension NotificationViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Notification.getNotificationCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath)
        let notifications = Notification.getNotifications()
        cell.detailTextLabel?.text = notifications[indexPath.row][0]
        cell.detailTextLabel?.textColor = Asset.accentColor.color
        cell.detailTextLabel?.font = FontFamily.Abel.regular.font(size: 10)
    
        cell.textLabel?.text = notifications[indexPath.row][1]
        cell.textLabel?.font = FontFamily.Abel.regular.font(size: 18)
        cell.textLabel?.textColor = Asset.defautTextColor.color
        return cell
    }
    
    
}

extension NotificationViewController : NotificationDelegate{
    func updateTableView() {
        notificationTable.reloadData()
    }
    
    
}

extension NotificationViewController : NavigationBarDelegate{
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showNotifications() {
        //unused
    }
    
    
}
