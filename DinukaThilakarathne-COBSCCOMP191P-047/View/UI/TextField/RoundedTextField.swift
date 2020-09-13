//
//  RoundedTextField.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class RoundedTextField: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var roundedTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        Bundle.main.loadNibNamed("RoundedTextField", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUI()
    }
    
    func setUI(){
        contentView.layer.cornerRadius = contentView.frame.height / 2
        contentView.backgroundColor = Asset.white.color.withAlphaComponent(0.3)
        
        roundedTextField.font = FontFamily.Abel.regular.font(size: 16)
        roundedTextField.textColor = Asset.white.color
    }
}
