//
//  RightIconButton.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/10/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class RightIconButton: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var contentHolder: UIView!
    @IBOutlet weak var rightIconButton: UIButton!{
        didSet{
            rightIconButton.titleLabel?.font = FontFamily.BebasNeue.regular.font(size: 20)
            rightIconButton.tintColor = Asset.primaryColor.color
        }
    }
    @IBOutlet weak var buttonIcon: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        Bundle.main.loadNibNamed("RightIconButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUI()
    }
    
    func setUI(){
        contentHolder.layer.cornerRadius = AppConstants.viewCornerRadius
    }
}
