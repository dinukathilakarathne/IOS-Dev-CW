//
//  ResultsViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/14/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    let controller = ResultViewController()

    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = "Results"
        }
    }
    @IBOutlet weak var resultsTableView: UITableView!{
        didSet{
            resultsTableView.delegate = self
            resultsTableView.dataSource = self
//            resultsTableView.register(UserResults.self, forCellReuseIdentifier: "ResultCell")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
        controller.getResults()
        
        resultsTableView.register(UINib(nibName: "UserResults", bundle: nil), forCellReuseIdentifier: "ResultCell")

    }

}

extension ResultsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Result.getResultCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = Result.getRestults()
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! UserResults
        let result = data[indexPath.row]
        cell.nameLabel.text = result.getName()
        cell.scoreLabel.text = result.getScoreMessage()
        cell.dateLabel.text = result.getDate()
        cell.scoreLabel.textColor = setFontColor(result.getScore())
        cell.contentView.backgroundColor = Asset.backgroundColor.color
        cell.selectionStyle = .none
        return cell
    }
    
    func setFontColor(_ score : Int) -> UIColor{
        if score < 6{
            return Asset.defaultYellow.color
        }else if score < 4{
            return Asset.defaultYellow.color
        }else if score < 2{
            return Asset.defaultGreen.color
        }else{
            return Asset.defaultRed.color
        }
    }
}

extension ResultsViewController : ResultViewDelegate{
    func reloadTableView() {
        print("reloading")
        self.resultsTableView.reloadData()
    }
    
    
}

extension ResultsViewController : NavigationBarDelegate
{
    func goBack() {
        self.dismiss(animated: true, completion:  nil)
    }
    
    func showNotifications() {
        //unused
    }
    
    
}


