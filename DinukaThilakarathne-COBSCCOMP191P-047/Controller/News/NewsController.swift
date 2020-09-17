//
//  NotificationController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/12/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

protocol  NewsDelegate {
    func updateTableView()
}

class NewsController{
    
    var db : DatabaseController?
    var delegate : NewsDelegate?
    
    init() {
        db = DatabaseController()
        db?.delegate = self
    }
    
    func getNews(){
        db?.getNews()
    }
    
}

extension NewsController : DatabaseDelegate{
    func newsDidLoad() {
        delegate?.updateTableView()
    }
}
