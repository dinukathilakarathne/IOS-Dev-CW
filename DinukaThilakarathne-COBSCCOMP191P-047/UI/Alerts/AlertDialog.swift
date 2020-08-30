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
    
    init(withTitle title : String, withMessage message : String, actionName action : String) {
        self.alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default, handler: nil))
        
    }
    
    func present(){
        alert.present(alert, animated: true)
    }
    
}
