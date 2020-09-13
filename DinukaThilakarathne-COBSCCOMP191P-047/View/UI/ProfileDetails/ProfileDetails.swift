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
    @IBOutlet weak var contentHolder: UIView!
    @IBOutlet weak var profileImage: UIImageView!{
        didSet{
            profileImage.downloaded(from: UserDefaults().userImage)
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!{
        didSet{
            nameLabel.text = UserDefaults().nameOfUser
        }
    }
    @IBOutlet weak var indexLabel: UILabel!{
        didSet{
            indexLabel.text = UserDefaults().userIndex
        }
    }
    @IBOutlet weak var addressLabel: UILabel!{
        didSet{
            addressLabel.text = UserDefaults().userAddress
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        Bundle.main.loadNibNamed("ProfileDetails", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUI()
        
//        print("address \(UserDefaults().userAddress)")
//        print("image \(UserDefaults().userImage)")
//        print("ind \(UserDefaults().userIndex)")
//        print("name \(UserDefaults().nameOfUser)")


    }
    
    func setUI(){
        contentHolder.layer.cornerRadius = AppConstants.viewCornerRadius
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.borderColor = Asset.primaryColor.color.cgColor
        profileImage.layer.borderWidth = 3
    }
}
