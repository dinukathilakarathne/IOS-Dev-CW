//
//  NotificationViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/12/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController{
    
    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = L10n.news
        }
    }
    @IBOutlet weak var newsTable: UITableView!{
        didSet{
            newsTable.delegate = self
            newsTable.dataSource = self
        }
    }
    
    var timer : Timer?
    var controller = NewsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
        startTimer()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getNews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }

    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true, block: { (timer) in
            self.getNews()
            self.newsTable.reloadData()
        })
    }
    
    func getNews(){
        controller.getNews()
    }

}

extension NewsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return News.getNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        let news = News.getNews()
        cell.detailTextLabel?.text = news[indexPath.row][0]
        cell.detailTextLabel?.textColor = Asset.secondaryColor.color
        cell.detailTextLabel?.font = FontFamily.Abel.regular.font(size: 10)
    
        cell.textLabel?.text = news[indexPath.row][1]
        cell.textLabel?.font = FontFamily.Abel.regular.font(size: 18)
        cell.textLabel?.textColor = Asset.defautTextColor.color
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension NewsViewController : NewsDelegate{
    
    func updateTableView() {
        newsTable.reloadData()
    }
}

extension NewsViewController : NavigationBarDelegate{
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showNotifications() {
        //unused
    }
    
    
}
