//
//  ViewController.swift
//  QuizApp
//
//  Created by Vivian Phung on 6/19/18.
//  Copyright © 2018 Vivian Phung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBAction func submitAnswer0(_ sender: Any) {
        checkAnswer(idx: 0)
    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
        checkAnswer(idx: 1)
    }
    
    @IBAction func submitAnswer2(_ sender: Any) {
        checkAnswer(idx: 2)
    }
    
    @IBAction func submitAnswer3(_ sender: Any) {
        checkAnswer(idx: 3)
    }

    var currentQuestion: Question?
    var currentQuestionPosition: Int = 0
    var noCorrect: Int = 0
    
    func checkAnswer(idx: Int) {
        if (currentQuestion!.correctAnswer == idx) {
            noCorrect += 1
        }
        loadNextQuestion()
    }
    func setQuestions() {
        questionLabel.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        progressLabel.text = "Question: \(currentQuestionPosition + 1)/ \(questions.count)"
    }
    func loadNextQuestion() {
        if (currentQuestionPosition + 1 < questions.count) {
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestions()
        } else {
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        }
    }
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    var questions: [Question] = [
        Question(
            question: "What is Taylor Swift's first album?",
            answers: ["1989","Taylor Swift", "Speak Now", "Fearless"],
            correctAnswer: 1),
        Question(
            question: "What is Taylor Swift's second album?",
            answers: ["1989", "Red", "Taylor Swift", "Fearless"],
            correctAnswer: 3),
        Question(
            question: "What is Taylor Swift's third album?",
            answers: ["Reputation", "Red", "Fearless", "Speak Now"],
            correctAnswer: 3),
        Question(
            question: "What is Taylor Swift's fourth album?",
            answers: ["1989", "Taylor Swift", "Red", "Fearless"],
            correctAnswer: 2),
        Question(
            question: "What is Taylor Swift's fifth album?",
            answers: ["Fearless", "1989", "Reputation", "Red"],
            correctAnswer: 1),
        Question(
            question: "What is Taylor Swift's sixth album?",
            answers: ["1989", "Reputation", "Red", "Fearless"],
            correctAnswer: 1)
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = questions[0]
        setQuestions() //this gives the value to the answers
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgShowResults") {
            print("begun")
            let vc = segue.destination as! ResultsViewController
            vc.noCorrect = noCorrect
            vc.total = questions.count
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

