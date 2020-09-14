//
//  ShareViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/14/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = L10n.share
        }
    }
    @IBOutlet weak var desc: UILabel!{
        didSet{
            desc.font = FontFamily.BebasNeue.regular.font(size: 20)
            desc.textColor = Asset.defautTextColor.color
            desc.text = "Your temperature is..."
            
        }
    }
    @IBOutlet weak var tempLabel: UILabel!{
        didSet{
            tempLabel.font = FontFamily.BebasNeue.regular.font(size: 60)
            tempLabel.textColor = Asset.defautTextColor.color
        }
    }
    
    @IBOutlet weak var shareButton: RoundedButton!{
        didSet{
            shareButton.contentView.backgroundColor = Asset.secondaryColor.color
            shareButton.roundButton.setTitle(L10n.share, for: .normal)
            shareButton.roundButton.tintColor = Asset.backgroundColor.color
            shareButton.roundButton.addTarget(self, action: #selector(shareAppPressed), for: .touchUpInside)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        setUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setUI(){
        tempLabel.text = "\(UserDefaults().recentTemperature)  °C"
    }
    
    //https://stackoverflow.com/questions/35931946/basic-example-for-sharing-text-or-image-with-uiactivityviewcontroller-in-swift
    @objc func shareAppPressed(){
        let text = "\(UserDefaults().recentTemperature) °C"

        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

        self.present(activityViewController, animated: true, completion: nil)
    }

}

extension ShareViewController : NavigationBarDelegate{
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showNotifications() {
        //unused
    }
    
    
}
