//
//  Survey.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/11/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

class Survey {
    private var surveyAnswer : [Int] = []
    private var FillDate = Date()
    
    init() {
        self.surveyAnswer = [-1,-1,-1,-1,-1]
    }
    
    private let questions : [String] = [
        "What is your age?",
        "How do you feel?",
        "Do you have any side affects?",
        "Past week how often did you talk with any of your neighbors?",
        "Did you spend anytime as a volunteer any organization"
    ]
    
    private let answers : [[String]] = [
        ["0-21", "21-30", "30+"],
        ["Very good", "Normal", "Poor"],
        ["Yes", "No"],
        ["Rarely", "Few times", "Daily"],
        ["Yes", "No"]
    ]
    
    func setAnswer(atIndex index : Int, answer a : Int){
        surveyAnswer[index] = a
    }
    
    func getAnswers() -> [Int] {
        return self.surveyAnswer
    }
    
    func getSurveyQuestions() -> [String] {
        return questions
    }
    
    func getSurveyAnswers() -> [[String]]{
        return answers
    }
    
    func questionCount() -> Int {
        return questions.count
    }
    
    
}
