//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let _true = "True"
    let _false = "False"
    
    var quiz: [Question] = []
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quiz = [
            Question(q: "A slug's blood is green.", a: "True"),
            Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
            Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
            Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
            Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
            Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
            Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
            Question(q: "Google was originally called 'Backrub'.", a: "True"),
            Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
            Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
            Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
            Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
            
        ]
        
        printQuiz(number: questionNumber)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].answer
        
        sender.backgroundColor = userAnswer == actualAnswer
        ? UIColor.green
        : UIColor.red
        
        questionNumber = questionNumber + 1 < quiz.count
        ? questionNumber + 1
        : 0
        
        // I do not neet to bind this Timer to the outside variable due to it does not repeat,
        // thus I cannot have to expire previous trigger.
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [self] Timer in
            printQuiz(number: questionNumber)
        }
    }
    
    private func printQuiz(number: Int) {
        questionLabel.text = quiz[number].text
        // Set default is able to '.none' or 'nil' or 'UIColor.claer'
        trueButton.backgroundColor = .none
        falseButton.backgroundColor = nil
//        falseButton.backgroundColor = UIColor.clear
    }
    
}

