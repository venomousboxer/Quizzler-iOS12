//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var correctAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.question
        correctAnswer = firstQuestion.answer
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag==1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber+=1
        if questionNumber < 13 {
            questionLabel.text=allQuestions.list[questionNumber].question
            correctAnswer=allQuestions.list[questionNumber].answer
            updateUI()
        } else {
            let alert = UIAlertController(title: "Awesome"
                , message: "Congratulations you have finished all the questions, do you want to start over ?"
                , preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func updateUI() {
        scoreLabel.text="Score : \(score)"
        progressLabel.text="\(questionNumber + 1) / 13"
        progressBar.frame.size.width=(view.frame.size.width / 13)*CGFloat(questionNumber + 1)
    }
    
    func checkAnswer() {
        if pickedAnswer == correctAnswer {
            // answer is correct
            ProgressHUD.showSuccess("Correct")
            score+=5
        } else {
            // answer is wrong
            ProgressHUD.showError("Wrong !")
        }
    }
    
    
    func startOver() {
        score=0
        questionNumber=0
        questionLabel.text=allQuestions.list[0].question
        correctAnswer=allQuestions.list[0].answer
        updateUI()
    }
}
