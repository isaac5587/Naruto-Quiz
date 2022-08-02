//
//  TitleViewController.swift
//  NarutoQuiz
//
//  Created by Trill Isaac on 8/2/22.
//

import Foundation
//This is the format used for organizing questions,answer choices, and answers for the quiz struct
struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], c: String){
        text = q
        answer = a
        correctAnswer = c
    }
}
