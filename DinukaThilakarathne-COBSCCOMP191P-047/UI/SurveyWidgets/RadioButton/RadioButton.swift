//
//  RadioButton.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/11/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

protocol RadioButtonDelegate {
    func radioPressed(_ tag : Int)
}

class RadioButton: UIButton {
    var alternateButton:Array<RadioButton>?
    var delegate : RadioButtonDelegate?
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
        self.layer.borderColor = Asset.primaryColor.color.cgColor
        self.layer.backgroundColor = UIColor.clear.cgColor

    }
    
    func unselectAlternateButtons() {
        if alternateButton != nil {
            self.isSelected = true
            
            for aButton:RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        } else {
            toggleButton()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }
    
    func toggleButton() {
        self.isSelected = !isSelected
        delegate?.radioPressed(self.tag)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.backgroundColor = Asset.primaryColor.color.cgColor
            } else {
                self.layer.backgroundColor = UIColor.clear.cgColor
            }
        }
    }
}
