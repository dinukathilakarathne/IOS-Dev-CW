//
//  AlertDialog.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class SingleActionAlert {
    
    let alert : UIAlertController
    let viewController : UIViewController
    
    init(withTitle title : String, withMessage message : String, actionName action : String, _ vc : UIViewController) {
        self.viewController = vc
        self.alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default, handler: nil))
    }
    
    func present(){
        viewController.present(alert, animated: true)
    }
}
