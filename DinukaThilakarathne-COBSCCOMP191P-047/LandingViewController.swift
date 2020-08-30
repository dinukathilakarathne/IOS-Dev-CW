//
//  ViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!{
        didSet{
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.contentView.bounds
            gradientLayer.colors = [UIColor.clear, Asset.darkBlue.color.cgColor]
            contentView.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    @IBOutlet weak var landingPageHeadingOutline: UILabel!{
        didSet{
            landingPageHeadingOutline.text = L10n.headingOutline
            landingPageHeadingOutline.font = FontFamily.Abel.regular.font(size: 20)
            landingPageHeadingOutline.textColor = Asset.white.color
        }
    }
    @IBOutlet weak var landingPageTitle: UILabel!{
        didSet{
            landingPageTitle.text = L10n.appName
            landingPageTitle.font = FontFamily.BebasNeue.regular.font(size: 60)
            landingPageTitle.textColor = Asset.white.color
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

