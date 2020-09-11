//
//  HelpViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/11/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = L10n.help
        }
    }
    @IBOutlet weak var sosButton: ImageButton!{
        didSet{
            sosButton.button.setImage(Asset.sos.image, for: .normal)
            sosButton.button.addTarget(self, action: #selector(callHelp), for: .touchUpInside)
            sosButton.contentView.backgroundColor = .clear
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc func callHelp(){
        callNumber(phoneNumber: "119")
    }
    
    //https://stackoverflow.com/questions/27259824/calling-a-phone-number-in-swift
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

extension HelpViewController : NavigationBarDelegate{
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showNotifications() {
        //unused
    }
}

