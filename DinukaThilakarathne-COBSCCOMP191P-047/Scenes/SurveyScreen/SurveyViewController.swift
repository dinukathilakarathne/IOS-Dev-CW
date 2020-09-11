//
//  SurveyViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/11/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
    
    let survey = Survey()

    @IBOutlet weak var navigationBar: NavigationBar!
    
    @IBOutlet weak var surveyQuestionStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestions()
    }
    
    func addQuestions(){
        let count = survey.questionCount() + 1
        let questions = survey.getSurveyQuestions()
        let answers = survey.getSurveyAnswers()
        for x in 1..<count{
            let questionView = SurveyQuestion()
            questionView.questionLabel.text = questions[x-1]
            let answerCount = answers[x-1].count
            for i in 0..<answerCount{
                let answer = Answer()
                let tag = "\(x)\(i)"
                answer.radioButton.tag = (tag as NSString).integerValue
                answer.radioButton.delegate = self
                answer.answers.text = answers[x-1][i]
                questionView.answerStack.addArrangedSubview(answer)

            }
            surveyQuestionStack.addArrangedSubview(questionView)
            
        }
    }
}

extension SurveyViewController : RadioButtonDelegate{
    func radioPressed(_ tag: Int) {
        print(tag)
    }
    
    func deselectAlternate(_ tag : Int){
        let tagStr = ("\(tag)").substring(from: 1)
        print(tagStr.sub)
    }
    
    
}
