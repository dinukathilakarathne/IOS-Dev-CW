//
//  SurveyQuestion.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/11/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class SurveyQuestion: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var contentHolder: UIView!
    @IBOutlet weak var questionLabel: UILabel!{
        didSet{
            questionLabel.font = FontFamily.Abel.regular.font(size: 16)
        }
    }
    
    @IBOutlet weak var answerStack: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        Bundle.main.loadNibNamed("SurveyQuestion", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUI()
    }
    
    func setUI(){
        contentHolder.layer.cornerRadius = AppConstants.viewCornerRadius
    }
}
