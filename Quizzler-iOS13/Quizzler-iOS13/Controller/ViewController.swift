//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    // Each UIButtons changed from 'Outlet' to 'Outlet Collection'.
    @IBOutlet var answerButton: [UIButton]!

    var quizBrain: QuizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()

        printQuiz()
    }

    // (_ sender: UIButton) : _ is the argument labels, but '_' means it is going to omit, sender is the parameters name
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else {
            return
        }

        sender.backgroundColor = quizBrain.checkAnswer(answer: userAnswer)
                ? UIColor.green
                : UIColor.red

        quizBrain.increaseQuestionNumber()

        // I do not need to bind this Timer to the outside variable due to it does not repeat,
        // thus I cannot have to expire previous trigger.
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [self] _ in
            printQuiz()
        }
    }

    private func printQuiz() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getCurrentQuestion()
        let answerList = quizBrain.getCurrentAnswerList()

        // enumerated() make to use index
        answerButton.enumerated().forEach { (index: Int, button: UIButton) in
            button.setTitle(answerList[index], for: .normal)
            button.backgroundColor = .none ?? nil ?? UIColor.clear
        }

        progressBar.progress = Float(quizBrain.questionNumber + 1) / Float(quizBrain.quizCount)
    }
}
