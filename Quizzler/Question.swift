//
//  Question.swift
//  Quizzler
//
//  Created by Mohit Yadav on 02/08/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let question : String
    let answer : Bool
    init (questionString : String, correctAnswer : Bool){
        question=questionString
        answer=correctAnswer
    }
}
