//
//  QuizBrain.swift
//  NarutoQuiz
//
//  Created by Trill Isaac on 8/2/22.
//

import Foundation

struct QuizBrain{
    
    // Struct that contains all questions, possible choices, and answers
    let quiz = [
        Question(q: "Which Akatsuki member launched an attack on the Hidden Leaf Village that led to the death of the 3rd Hokage?", a: ["Kakuzu", "Sasori", "Orochimaru"], c: "Orochimaru"),
        Question(q: "How old was Sasuke brother's Itachi when he graduated from the academy and became a Genin?", a: ["7", "8", "9"], c: "7"),
        Question(q: "Shortly after the Chunin Exam Preliminairies, which Proctor is killed?", a: ["Ibiki Morino", "Hayate Gekko", "Anko Mitarashi"], c: "Hayate Gekko"),
        Question(q: "Which Hokage sealed the nine-tailed fox inside Naruto?", a: ["First Hokage", "Third Hokage", "Fourth Hokage"], c: "Fourth Hokage"),
        Question(q: "What is the name of the nine-tailed demon fox that terrorized the Konohagakure village?", a: ["Koruma", "Kyubi", "Youko"], c: "Kyubi"),
        Question(q: "How does one receive the Mangekyo Sharingan?", a: ["See loved one die", "Kill a forbidden Ninja", "Inherit it from the clan"], c: "See loved one die"),
        Question(q: "Who does Naruto respect the most?", a: ["Minato Namikaze", "Iruka", "Jiraiya"], c: "Iruka"),
        Question(q: "Who summoned the five kage for the five kage summit?", a: ["Tobi", "Kakashi", "Raikage"], c: "Raikage"),
        Question(q: "What is Zabuza Momochi's alias?", a: ["The Hidden Cloud Demon", "The Demon of the Hidden Mist", "Hidden Demon"], c: "The Demon of the Hidden Mist"),
        Question(q: "Which Akatsuki member cut off Orochimaru's left hand?", a: ["Pain", "Itachi", "Sasuke"], c: "Itachi"),
        Question(q: "Who was the Legendary Sannin's sensei?", a: ["Sarutobi", "Minato", "Kakashi"], c: "Sarutobi"),
        Question(q: "Which of these ninja became a Genin at the youngest age?", a: ["Itachi", "Shisui", "Kakashi"], c: "Kakashi"),
        Question(q: "When does Sasuke's Kekkai Genkai awaken?", a: ["Fight with Naruto", "Fight with Itachi", "Fight with Haku"], c: "Fight with Haku"),
        Question(q: "What is Naruto's favorite food?", a: ["Ramen", "Sushi", "Eggrolls"], c: "Ramen"),
        Question(q: "Wish I could stick around and play a little longer...Who said this?", a: ["Orochimaru", "Neji", "Kabuto"], c: "Kabuto"),
        Question(q: "Which of these characters has their ear's pierced?", a: ["Shikamaru", "Rock Lee", "Sasuke"], c: "Shikamaru"),
        Question(q: "Why does Sasuke want to kill Itachi?", a: ["He joined the Akatsuki", "He wants the reward money", "He killed his family"], c: "He killed his family"),
        Question(q: "I am Rock Lee's mentor. Who am I?", a: ["Sarutobi Sensei", "Gai Sensei", "Gaara"], c: "Gai Sensei"),
        Question(q: "What does the symbol on Gaara's forehead mean?", a: ["Forgiveness", "Love", "Hate"], c: "Love"),
        Question(q: "How did Itachi get his Mangekyou Sharingan?", a: ["He killed Oroachimaru", "He killed Sasuke", "He killed Shisui"], c: "He killed Shisui"),
        Question(q: "Who is the first person Naruto successfully uses Rasengan on?", a: ["Jiraya", "Mizuki", "Kabuto"], c: "Kabuto"),
        Question(q: "Konohamaru is related to which Kazekage?", a: ["The Second Kazekage", "The Third Kazekage", "None of the Above"], c: "None of the Above"),
        Question(q: "Who tricked Naruto into stealing a sacred scroll?", a: ["Mizuki", "Shikamaru", "Ebisu"], c: "Mizuki"),
        Question(q: "What team is Shino Aburame on?", a: ["9", "6", "8"], c: "8"),
        Question(q: "Which of these powers does every Mangekyo Sharingan possess?", a: [" Amaterasu", "Tsukuyomi", "Each eye is unique"], c: "Each eye is unique")
    ]
    
    var questionNumber = 0; //variable to keep track of questions in struct
    var scoreCount = 0; //variable to keep track of questions answered correctly
    var finalScore = 0;
    //This modifies the score if user answers questions correctly
    mutating func checkAnswer(_ userAnswer:String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            //if user got the question right
            scoreCount += 1
            return true
        } else {
            //if user got the question wrong
            return false
        }
    }
    
    //These functions return the specfic answer choices for buttons A,B,C from struct
    func getButtonAtext() -> String{
        return quiz[questionNumber].answer[0]
    }
    func getButtonBtext()-> String{
        return quiz[questionNumber].answer[1]
    }
    func getButtonCtext()-> String{
        return quiz[questionNumber].answer[2]
    }
    
    //This returns the question text from struct
    func getQuestionText() -> String {
        let questionText = quiz[questionNumber].text
        return questionText
    }
    
    // This Keeps track of the progress of the quiz for the progress bar
    func getProgress() -> Float {
        let progressNumber = Float(questionNumber)/Float(quiz.count)
        return progressNumber
    }
    
    //this creates a question cycle for the quiz from start to finish
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        } else {
            questionNumber = 0
            finalScore = scoreCount
            scoreCount = 0
        }
    }
    
    //This returns the user's current score
    func getScore() -> Int{
        return scoreCount
    }
    
    func getQuestionsTotal() -> Int{
        return quiz.count
    }
    
    func getScoreFraction() -> Double{
        return Double(finalScore) / Double(quiz.count)
    }
    
    func getQuestionNumber() -> Int {
        return questionNumber
    }
    
    func getFinalScore() -> Int{
        return finalScore
    }
}
