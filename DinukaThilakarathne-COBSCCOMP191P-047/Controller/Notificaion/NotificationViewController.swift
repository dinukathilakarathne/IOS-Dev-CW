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
            navigationBar.title.text = L10n.newNotificationsTitle
        }
    }
    @IBOutlet weak var notificationTable: UITableView!{
        didSet{
            notificationTable.delegate = self
            notificationTable.dataSource = self
        }
    }
    @IBOutlet weak var newNotificationButton: RoundedButton!{
        didSet{
            newNotificationButton.contentView.backgroundColor = Asset.primaryColor.color
            newNotificationButton.roundButton.setTitle("Create notification", for: .normal)
            newNotificationButton.roundButton.tintColor = Asset.backgroundColor.color
            newNotificationButton.roundButton.addTarget(self, action: #selector(createNotification), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!
    
    var timer : Timer?
    var controller = NotificationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
        startTimer()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getNotifications()
        setUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    @objc func createNotification(){
        controller.createNotificationPressed()
    }
    
    func setUI(){
        if UserDefaults().isAdmin{
            newNotificationButton.isHidden = false
            buttonHeight.constant = 50
        }else{
            newNotificationButton.isHidden = true
            buttonHeight.constant = 0
        }
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (timer) in
            self.getNotifications()
            self.notificationTable.reloadData()
        })
    }
    
    func getNotifications(){
        controller.getNotifications()
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
        cell.detailTextLabel?.textColor = Asset.secondaryColor.color
        cell.detailTextLabel?.font = FontFamily.Abel.regular.font(size: 10)
    
        cell.textLabel?.text = notifications[indexPath.row][1]
        cell.textLabel?.font = FontFamily.Abel.regular.font(size: 18)
        cell.textLabel?.textColor = Asset.defautTextColor.color
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension NotificationViewController : NotificationDelegate{
    
    func createNotificationPressed() {
        let storyboard = UIStoryboard(name: "NewNotification", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NewNotificationViewController")
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
    
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
