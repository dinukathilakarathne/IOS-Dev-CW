//
//  NavigationBar.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/2/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

protocol NavigationBarDelegate {
    func goBack()
    func showNotifications()
}

class NavigationBar: UIView {
    
    var delegate : NavigationBarDelegate?

    @IBOutlet var contentView: UIView!{
        didSet{
            contentView.backgroundColor = Asset.backgroundColor.color
        }
    }
    @IBOutlet weak var backButton: UIButton!{
        didSet{
            backButton.tintColor = Asset.defautTextColor.color
        }
    }
    @IBOutlet weak var title: UILabel!{
        didSet{
            title.font = FontFamily.Abel.regular.font(size: 20)
            title.textColor = Asset.defautTextColor.color
        }
    }
    @IBOutlet weak var notifications: UIButton!{
        didSet{
            
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
        Bundle.main.loadNibNamed("NavigationBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUI()
    }
    
    func setUI(){
        //unused
    }

    @IBAction func goBackPressed(_ sender: UIButton) {
        delegate?.goBack()
    }
    @IBAction func notificationPressed(_ sender: UIButton) {
        delegate?.showNotifications()
    }
}
