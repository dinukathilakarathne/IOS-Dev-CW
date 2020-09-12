//
//  PresentStatsViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/31/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class PresentStatsViewController: UIViewController {
    
    let controller = PresentStatsController()
    var timer : Timer?

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
            surveyButton.addTarget(self, action: #selector(openSurveyPressed), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
        updateSlider()
        setUI()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
        })
    }
    
    func setUI(){
        temperatureView.layer.cornerRadius = AppConstants.viewCornerRadius
    }
    
    @objc func updateTemperaturePressed(){
        if UserDefaults().isLoggedIn{
            controller.submitButtonPressed()
        }else{

            controller.userNotAvailable()
        }
        
    }
    
    @objc func openSurveyPressed(){
        if UserDefaults().isLoggedIn{
            controller.surveyButtonPressed()
        }else{
            controller.userNotAvailable()
        }
    }

    func updateSlider(){
        let step : Float = 0.5
        let roundedValue = round(temperatureSlider.value / step) * step
        controller.sliderDidChange(roundedValue)
        temperatureLabel.text = "\(roundedValue) °C"
    }
    
    @IBAction func valueChanged(_ sender: UISlider) {
        updateSlider()
    }
    
    
}

extension PresentStatsViewController : PresentStatsDelegate{
    func submitButtonPressed() {
        SingleActionAlert(withTitle: "Success", withMessage: "Successfully submitted the temperature. Thank you for your cooperation for safety", actionName: L10n.ok, self).present()
    }
    
    func showSurveyScreen() {
        let storyboard = UIStoryboard(name: "Survey", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SurveyViewController")
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
    
    
    func userNotLoggedIn() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LandingViewController")
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
    
    
}
