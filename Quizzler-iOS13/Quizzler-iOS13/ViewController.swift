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

    var quiz: [[String]] = []

    var questionNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quiz = [
            ["Four + Two is equal to Six.", _true],
            ["Five - Three is greater than One", _true],
            ["Three + Eight is less than Ten", _false]
        ]

        printQuiz(number: questionNumber)
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]

        if userAnswer == actualAnswer {
            print("Right")
        } else {
            print("Wrong!")
        }

        userAnswer == actualAnswer ? print("Right") : print("Wrong!")

        questionNumber = questionNumber + 1 < quiz.count
                ? questionNumber + 1
                : 0

        printQuiz(number: questionNumber)
    }

    private func printQuiz(number: Int) {
        questionLabel.text = quiz[number][0]
    }

}

