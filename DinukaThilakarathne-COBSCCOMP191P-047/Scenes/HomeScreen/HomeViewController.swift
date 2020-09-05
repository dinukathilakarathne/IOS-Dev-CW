//
//  HomeViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/31/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var currentStatsTitle: UILabel!{
        didSet{
            currentStatsTitle.font = FontFamily.Abel.regular.font(size: 20)
            currentStatsTitle.text = L10n.currentStats
            currentStatsTitle.textColor = Asset.defautTextColor.color
        }
    }
    
    @IBOutlet var currentStatView : [LocalStat]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }
    
    
}
