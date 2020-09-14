//
//  PresentStatsController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/11/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation
import Firebase

protocol PresentStatsDelegate {
    func userNotLoggedIn()
    func showSurveyScreen()
    func submitButtonPressed()
}

class PresentStatsController {
    
    let db = DatabaseController()
    var delegate : PresentStatsDelegate?
    var temperature : Float = 0
    var location : [Double] = []
    
    func surveyButtonPressed(){
        delegate?.showSurveyScreen()
    }
    
    func userNotAvailable(){
        if !UserDefaults().isLoggedIn{
            delegate?.userNotLoggedIn()
        }
    }
    
    func submitButtonPressed(){
        UserDefaults().recentTemperature = self.temperature
        db.updateTemperature(self.temperature)
        db.updateLocation( self.location)
        delegate?.submitButtonPressed()
    }
    
    func sliderDidChange(_ value : Float){
        self.temperature = value
    }
    
    func setLocation(_ loc : [Double]){
        self.location = loc
    }
    
}
