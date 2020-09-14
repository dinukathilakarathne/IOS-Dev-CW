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
    private var fillDate = Date()
    private var score : Int!
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
        ["No", "Yes"],
        ["Rarely", "Few times", "Daily"],
        ["No", "Yes"]
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
    
    func calculateDangerScore(_ answers : [Int]) -> Int{
        var score = 0
        for x in 1..<answers.count{
            score += answers[x]
        }
        return score
    }
}
