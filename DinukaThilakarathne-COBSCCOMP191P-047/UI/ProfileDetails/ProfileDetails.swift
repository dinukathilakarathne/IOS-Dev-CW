//
//  profileDetails.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/10/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class profileDetails: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var profileImage: UIImageView!{
        didSet{
            if let imageURL = UserDefaults().userImage{
                profileImage.image = 
            }
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
}
