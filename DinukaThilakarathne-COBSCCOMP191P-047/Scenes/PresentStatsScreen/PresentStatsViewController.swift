//
//  PresentStatsViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/31/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class PresentStatsViewController: UIViewController {
    
    let db = DatabaseController()
    var temperature : Float = 0

    @IBOutlet weak var temperatureLabel: UILabel!{
        didSet{
            temperatureLabel.font = FontFamily.BebasNeue.regular.font(size: 60)
            temperatureLabel.textColor = Asset.defautTextColor.color
        }
    }
    
    @IBOutlet weak var temperatureView: UIView!
    @IBOutlet weak var updateTempButton: RoundedButton!{
        didSet{
            updateTempButton.contentView.backgroundColor = Asset.primaryColor.color
            updateTempButton.roundButton.tintColor = Asset.white.color
            updateTempButton.roundButton.setTitle(L10n.submit, for: .normal)
            updateTempButton.roundButton.addTarget(self, action: #selector(updateTemperaturePressed), for: .touchUpInside)
        }
    }
    @IBOutlet weak var temperatureSlider: UISlider!
    @IBOutlet weak var surveyButton: UIButton!{
        didSet{
            surveyButton.setTitle(L10n.openSurvey, for: .normal)
            surveyButton.titleLabel?.font = FontFamily.BebasNeue.regular.font(size: 20)
            surveyButton.tintColor = Asset.accentColor.color
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSlider()
        setUI()
    }
    
    func setUI(){
        temperatureView.layer.cornerRadius = AppConstants.viewCornerRadius
    }
    
    @objc func updateTemperaturePressed(){
        db.updateTemperature(self.temperature)
    }

    func updateSlider(){
        let step : Float = 0.5
        let roundedValue = round(temperatureSlider.value / step) * step
        self.temperature = roundedValue
        temperatureLabel.text = "\(roundedValue) °C"
    }
    
    @IBAction func valueChanged(_ sender: UISlider) {
        updateSlider()
    }
    
    
}
