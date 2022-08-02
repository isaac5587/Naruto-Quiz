//
//  ViewController.swift
//  NarutoQuiz
//
//  Created by Trill Isaac on 8/2/22.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var QuestionViewLabel: UILabel!
    @IBOutlet weak var answerButtonA: UIButton!
    @IBOutlet weak var answerButtonB: UIButton!
    @IBOutlet weak var answerButtonC: UIButton!
    @IBOutlet weak var progressViewBar: UIProgressView!
    var quizBrain = QuizBrain() //creating quizbrain object to use in view controller
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonClicked(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // true or false
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        updateUI()
    }
    
    func bringEndScreen(){
        if quizBrain.questionNumber == 0 {
            self.performSegue(withIdentifier: "toEndScreen", sender: self)
        }
    }
    
    //Makes necessary updates to the UI based on the user's actions
    func updateUI(){
        bringEndScreen()
        QuestionViewLabel.text = quizBrain.getQuestionText()
        answerButtonA.setTitle(quizBrain.getButtonAtext(), for: .normal)
        answerButtonB.setTitle(quizBrain.getButtonBtext(), for: .normal)
        answerButtonC.setTitle(quizBrain.getButtonCtext(), for: .normal)
        progressViewBar.progress = quizBrain.getProgress()
        totalScoreLabel.text = "Score: \(quizBrain.getScore())"
        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.answerButtonA.backgroundColor = UIColor.orange.withAlphaComponent(1)
            self.answerButtonB.backgroundColor = UIColor.cyan.withAlphaComponent(1)
            self.answerButtonC.backgroundColor = UIColor.black.withAlphaComponent(1)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEndScreen" { //condition for segue id
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.score = quizBrain.getFinalScore()
            destinationVC.questionsTotal = quizBrain.getQuestionsTotal()
            destinationVC.scorePercentage = quizBrain.getScoreFraction()
        }
    }
}
