//
//  SurveyController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/11/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

protocol SurveyDelegate {
    func submitPressed()
    func incompleteSurvey()
}

class SurveyController {
    
    let db = DatabaseController()
    let survey = Survey()
    
    var delegate : SurveyDelegate?
    var isComplete = true
    var answered : [Int] = []
    var score : Int!

    func setAnswers(_ answers : [Int]){
        self.answered = answers
    }
    
    func submitButtonPressed(){
        self.score = survey.calculateDangerScore(answered)
        checkSurveyCompletion()
    }
    
    func checkSurveyCompletion(){
        isComplete = true
        for x in answered{
            if x < 0{
                isComplete = false
                break
            }
        }
        if isComplete{
            db.updateSurveyResults(answers: answered, score)
            delegate?.submitPressed()
        }else{
            delegate?.incompleteSurvey()
        }
    }
    
}
