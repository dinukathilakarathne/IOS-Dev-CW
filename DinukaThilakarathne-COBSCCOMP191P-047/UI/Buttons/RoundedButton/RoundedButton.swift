//
//  RoundedButton.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class RoundedButton: UIView {

    @IBOutlet weak var contentView: UIView!{
        didSet{
            contentView.backgroundColor = Asset.white.color
        }
    }
    
    @IBOutlet weak var roundButton: UIButton!{
        didSet{
            roundButton.titleLabel?.font = FontFamily.BebasNeue.regular.font(size: 20)
            roundButton.tintColor = Asset.primaryColor.color
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
        Bundle.main.loadNibNamed("RoundedButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        setUI()
    }
    
    func setUI(){
        contentView.layer.cornerRadius = contentView.frame.height/2

    }
}

//https://medium.com/better-programming/swift-3-creating-a-custom-view-from-a-xib-ecdfe5b3a960
