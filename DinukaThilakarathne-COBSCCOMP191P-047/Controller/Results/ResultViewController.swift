//
//  ResultViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/14/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

protocol ResultViewDelegate {
    func reloadTableView()
}

class ResultViewController{
    var db : DatabaseController!
    var delegate : ResultViewDelegate?
    
    init() {
        db = DatabaseController()
        db.delegate = self
    }
    
    func getResults(){
        Result.clearResults()
        db.getAllResults()
    }
    
}

extension ResultViewController : DatabaseDelegate{
    func resultsDidLoad() {
        print("reloaded data")
        delegate?.reloadTableView()
    }
}
