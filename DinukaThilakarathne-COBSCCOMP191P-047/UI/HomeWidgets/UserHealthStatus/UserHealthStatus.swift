//
//  UserHealthStatus.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/3/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class UserHealthStatus: UIView {
    @IBOutlet weak var statusImage: UIImageView!
    
    @IBOutlet weak var temperaturLabel: UILabel!{
        didSet{
            statusLabel.text = L10n.signUpPageTitle
            statusLabel.font = FontFamily.BebasNeue.regular.font(size: 30)
            statusLabel.textColor = Asset.defautTextColor.color
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!{
        didSet{
            statusLabel.text = L10n.signUpPageTitle
            statusLabel.font = FontFamily.BebasNeue.regular.font(size: 24)
            statusLabel.textColor = Asset.defautTextColor.color
        }
    }
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var contentHolder: UIView!
    var isAllowed : Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        print("health status init")
        Bundle.main.loadNibNamed("UserHealthStatus", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUI()
    }
    
    func setUI(){
        contentHolder.layer.cornerRadius = AppConstants.viewCornerRadius
        setStatus()
    }
    
    func setStatus(){
        if isAllowed {
            statusImage.image = Asset.tick.image
            statusLabel.text = L10n.canAttendCollege
            statusLabel.textColor = Asset.defaultGreen.color
        }else{
            statusImage.image = Asset.cross.image
            statusLabel.text = L10n.stayAtHome
            statusLabel.textColor = Asset.defaultRed.color

        }
    }
}
