//
//  String+Extension.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/30/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit


extension UILabel {
    static func spaceLabel() -> UILabel {
        let spacingLabel = UILabel()
        spacingLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        spacingLabel.textColor = .white
        spacingLabel.textAlignment = .center
        spacingLabel.font = UIFont.boldSystemFont(ofSize: 18)
        spacingLabel.text = "LIKE ME"
        spacingLabel.backgroundColor = .red
        return spacingLabel
    }
    // adding space between each characters
    func addCharacterSpacing(value: Double = 3) {
        if let labelText = text, labelText.isEmpty == false {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(.kern,
                                          value: value,
                                          range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
