//
//  ResultsViewController.swift
//  NarutoQuiz
//
//  Created by Trill Isaac on 8/2/22.
//

import Foundation
import UIKit

class ResultsViewController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var retakeQuizButton: UIButton!
    var score = 0
    var questionsTotal = 0
    var scorePercentage = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackgroundimage()
        changeRankLabel()
        scoreLabel.text = "Your score was \(score) / \(questionsTotal)"
        print(scorePercentage)
    }
    
    
    @IBAction func retakeQuizPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor.yellow
        self.dismiss(animated: true, completion: nil)
    }
    
    func changeBackgroundimage(){
        if (scorePercentage > 0.85 && scorePercentage <= 1.0){
            let backgroundImage = imageView
            backgroundImage?.image = UIImage(named: "boruto2")
            backgroundImage?.contentMode =  UIView.ContentMode.scaleAspectFill
            self.view.insertSubview(backgroundImage!, at: 0)
            retakeQuizButton.backgroundColor = UIColor.purple.withAlphaComponent(1)
        }else if (scorePercentage > 0.70 && scorePercentage <= 0.84){
            let backgroundImage = imageView
            backgroundImage?.image = UIImage(named: "boruto1")
            backgroundImage?.contentMode =  UIView.ContentMode.scaleAspectFill
            self.view.insertSubview(backgroundImage!, at: 0)
            retakeQuizButton.backgroundColor = UIColor.cyan.withAlphaComponent(1)
            
        }else{
            let backgroundImage = imageView
            backgroundImage?.image = UIImage(named: "boruto3")
            backgroundImage?.contentMode =  UIView.ContentMode.scaleAspectFill
            self.view.insertSubview(backgroundImage!, at: 0)
            retakeQuizButton.backgroundColor = UIColor.red.withAlphaComponent(1)
            
        }
    }
    
    func changeRankLabel(){
        if (scorePercentage > 0.95 && scorePercentage <= 1.0){
            rankLabel.text = "You ranked 'S' on your mission 🏆"
        }else if (scorePercentage > 0.90 && scorePercentage <= 0.94){
            rankLabel.text = "You ranked 'A' on your mission 🥇"
        }else if (scorePercentage > 0.80 && scorePercentage <= 0.89){
            rankLabel.text = "You ranked 'B' on your mission 🥈"
        }else if (scorePercentage > 0.70 && scorePercentage <= 0.79){
            rankLabel.text = "You ranked 'C' on your mission 🥉"
        }else if (scorePercentage > 0.55 && scorePercentage <= 0.69){
            rankLabel.text = "You ranked 'D' on your mission 🏮"
        }else{
            rankLabel.text = "You failed your mission!💩 Try Again! "
        }
    }
}
