//
//  LocalStat.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/5/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class LocalStat: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var statName: UILabel!{
        didSet{
            statName.font = FontFamily.Abel.regular.font(size: 16)
        }
    }
    
    @IBOutlet weak var statValue: UILabel!{
        didSet{
            statValue.font = FontFamily.BebasNeue.regular.font(size: 30)
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
        Bundle.main.loadNibNamed("LocalStat", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUI()
    }
    
    func setUI(){
        contentView.layer.cornerRadius = AppConstants.viewCornerRadius
    }
}
