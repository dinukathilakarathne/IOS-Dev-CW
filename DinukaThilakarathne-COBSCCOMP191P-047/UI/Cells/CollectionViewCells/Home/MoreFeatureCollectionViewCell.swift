//
//  MoreFeatureCollectionViewCell.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/5/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class MoreFeatureCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var contentHolder: UIView!

    @IBOutlet weak var cellTitle: UILabel!{
        didSet{
            cellTitle.font = FontFamily.BebasNeue.regular.font(size: 16)
        }
    }
    
    override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            if newValue {
                super.isSelected = true
                contentHolder.backgroundColor = Asset.primaryColor.color
            } else if newValue == false {
                super.isSelected = false
                contentHolder.backgroundColor = Asset.accentColor.color
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setUI(){
        contentHolder.layer.cornerRadius = 25
    }
}
