//
//  UserResults.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/14/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class UserResults: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!{
        didSet{
            nameLabel.font = FontFamily.Abel.regular.font(size: 16)
            nameLabel.textColor = Asset.defautTextColor.color
        }
    }
    @IBOutlet weak var scoreLabel: UILabel!{
        didSet{
            scoreLabel.font = FontFamily.BebasNeue.regular.font(size: 20)
        }
    }
    @IBOutlet weak var dateLabel: UILabel!{
        didSet{
            dateLabel.font = FontFamily.Abel.regular.font(size: 14)
            dateLabel.textColor = Asset.primaryColor.color
        }
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
}
