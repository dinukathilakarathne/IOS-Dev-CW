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
    var questionViews : [SurveyQuestion] = []
    let controller = SurveyController()

    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = L10n.surveyTitle
        }
    }
    
    @IBOutlet weak var surveyQuestionStack: UIStackView!
    
    @IBOutlet weak var submitSurveyButton: RoundedButton!{
        didSet{
            submitSurveyButton.contentView.backgroundColor = Asset.defaultGreen.color
            submitSurveyButton.roundButton.tintColor = Asset.defautTextColor.color
            submitSurveyButton.roundButton.setTitle(L10n.submit, for: .normal)
            submitSurveyButton.roundButton.addTarget(self, action: #selector(submitSurveyPressed), for: .touchUpInside)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
        addQuestions()
        
    }
    
    @objc func submitSurveyPressed(){
        controller.setAnswers(survey.getAnswers())
        controller.submitButtonPressed()
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
            questionViews.append(questionView)
            surveyQuestionStack.addArrangedSubview(questionView)
            
        }
    }
}

extension SurveyViewController : RadioButtonDelegate{
    
    func radioPressed(_ tag: Int) {
        deselectAlternate(tag)
    }
    
    //method to deselect radio button
    func deselectAlternate(_ tag : Int){
        let tagStr = String(tag)
        let firstIndex = tagStr[0]
        let secondIndex = tagStr[1]
        let a = Int(secondIndex) ?? -1
        
        for x in 0..<questionViews.count{
            let q = questionViews[x]
            for i in q.answerStack.arrangedSubviews{
                let answer = i as! Answer
                
                let buttonTag = answer.radioButton.tag
                let buttonTagStr = String(buttonTag)
                let buttonTagFirstIndex = buttonTagStr[0]
                
                if buttonTagFirstIndex == firstIndex{
                    if buttonTag == tag{
                        answer.radioButton.isSelected = true
                        survey.setAnswer(atIndex: x, answer: a)
                    }else{
                        answer.radioButton.isSelected = false
                    }
                    
                }
            }
        }        
    }
    
    
}

extension SurveyViewController : NavigationBarDelegate{
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showNotifications() {
        //unused
    }
}

extension SurveyViewController : SurveyDelegate{
    func incompleteSurvey() {
        SingleActionAlert(withTitle: "Incomplete survey", withMessage: "You have to complete the survey to submit it", actionName: L10n.ok, self).present()
    }
    
    func submitPressed() {
        SingleActionAlert(withTitle: "Thank you!", withMessage: "Thank you for taking your time to fill this survey. Your results have been recorded", actionName: "Close", self).present()
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
