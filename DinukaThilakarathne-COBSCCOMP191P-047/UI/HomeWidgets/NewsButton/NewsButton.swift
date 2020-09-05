//
//  NewsButton.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/5/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class NewsButton: UIView {

    @IBOutlet weak var contentHolder: UIView!
    @IBOutlet var contentView: UIView!{
        didSet{
            contentView.backgroundColor = Asset.backgroundColor.color
        }
    }
    
    @IBOutlet weak var buttonImage: UIImageView!
    
    @IBOutlet weak var buttonLabel: UILabel!{
        didSet{
            buttonLabel.text = L10n.news
            buttonLabel.font = FontFamily.BebasNeue.regular.font(size: 30)
            buttonLabel.textColor = Asset.defautTextColor.color
        }
    }
    
    @IBOutlet weak var button: UIButton!{
        didSet{
            button.addTarget(self, action: #selector(newsButtonPressed), for: .touchUpInside)
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
        Bundle.main.loadNibNamed("NewsButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUI()
    }
    
    func setUI(){
        contentHolder.layer.cornerRadius = AppConstants.viewCornerRadius
    }
    
    @objc func newsButtonPressed() {
        //unused
        print("news button pressedd")
    }
    
}


